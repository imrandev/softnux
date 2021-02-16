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

class MyDeviceBottomNavState extends ApplicationState {

}

class MyLocationBottomNavState extends ApplicationState {

}

class MoreBottomNavState extends ApplicationState {

}

class LoaderFormState extends ApplicationState {
  final bool visibility;

  LoaderFormState(this.visibility);

  List<Object> get props => [visibility];
}
