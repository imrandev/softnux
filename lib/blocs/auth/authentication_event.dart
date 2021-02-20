part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class CheckAuthStatus extends AuthenticationEvent {

}

class GoogleSignInEvent extends AuthenticationEvent {

}