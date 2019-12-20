import 'dart:async';

import './service.dart';
import './user_events.dart';

class UserBloc {
  List<String> _usernames = [];

  final _userStateController = StreamController<List<String>>();
  StreamSink<List<String>> get _inUsers => _userStateController.sink;
  Stream<List<String>> get users => _userStateController.stream;

  final _userEventController = StreamController<UserEvent>();
  Sink<UserEvent> get userEventSink => _userEventController.sink;

  UserBloc() {
    _userEventController.stream.listen(_handleEvent);
  }

  void _handleEvent(UserEvent event) async {
    int number;
    if (event is SingleUserEvent)
      number = 1;
    else if (event is MultipleUsersEvent) number = event.number;

    this._usernames = await fetchUsernames(number);

    _inUsers.add(_usernames);
  }

  void dispose() {
    _userEventController.close();
    _userStateController.close();
  }
}
