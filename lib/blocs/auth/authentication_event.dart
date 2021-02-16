part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class PasswordVisibilityEvent extends AuthenticationEvent {

  final bool visibility;
  final String password;

  const PasswordVisibilityEvent(this.visibility, this.password);

  List<Object> get props => [visibility, password];
}

class CheckAuthStatus extends AuthenticationEvent {

}

class GoogleSignInEvent extends AuthenticationEvent {

}