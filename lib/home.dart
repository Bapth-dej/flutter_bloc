import 'package:flutter/material.dart';

import './user_bloc.dart';
import './user_events.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<List<String>>(
            stream: _bloc.users,
            initialData: [],
            builder: (context, snapshot) {
              List<String> listOfUsernames = snapshot.data;
              return ListView.builder(
                itemCount: listOfUsernames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listOfUsernames[index]),
                  );
                },
              );
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _bloc.userEventSink.add(SingleUserEvent()),
            tooltip: 'Fetch One',
            child: Icon(Icons.repeat_one),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => _bloc.userEventSink.add(MultipleUsersEvent(15)),
            tooltip: 'Fetch Multiple',
            child: Icon(Icons.repeat),
          ),
        ],
      ),
    );
  }
}
