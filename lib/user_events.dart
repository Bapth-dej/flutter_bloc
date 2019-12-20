abstract class UserEvent {}

class SingleUserEvent extends UserEvent {}

class MultipleUsersEvent extends UserEvent {
  final int number;
  MultipleUsersEvent(this.number);
}
