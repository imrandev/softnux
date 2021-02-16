part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  final bool visibility;
  final String password;

  const InitialAuthenticationState(this.visibility, this.password);

  List<Object> get props => [visibility, password];
}

class PasswordVisibilityState extends AuthenticationState {
  final bool visibility;
  final String password;

  const PasswordVisibilityState(this.visibility, this.password);

  List<Object> get props => [visibility, password];
}

class AuthenticationLoading extends AuthenticationState {

}

class AuthenticationInitialized extends AuthenticationState {

}

class AuthenticationUninitialized extends AuthenticationState {

}
