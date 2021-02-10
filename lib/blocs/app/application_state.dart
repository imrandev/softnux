part of 'application_bloc.dart';

@immutable
abstract class ApplicationState {
  const ApplicationState();
}

class ApplicationInitial extends ApplicationState {}

class CurrentUserState extends ApplicationState {
  final String username;

  CurrentUserState(this.username);

  List<Object> get props => [username];
}

class NoUsernameState extends ApplicationState {

}

class HomeBottomNavState extends ApplicationState {

}

class HotJobsBottomNavState extends ApplicationState {

}

class ShortListedBottomNavState extends ApplicationState {

}

class MoreBottomNavState extends ApplicationState {

}

class SubmitFormState extends ApplicationState {
  final bool visibility;

  SubmitFormState(this.visibility);

  List<Object> get props => [visibility];
}
