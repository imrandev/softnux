part of 'application_bloc.dart';

@immutable
abstract class ApplicationState {
  const ApplicationState();
}

class ApplicationInitial extends ApplicationState {}

class UsernameState extends ApplicationState {
  final String username;

  UsernameState(this.username);

  List<Object> get props => [username];
}

class NoUsernameState extends ApplicationState {}
