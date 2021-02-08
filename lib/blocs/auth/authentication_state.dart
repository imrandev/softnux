part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {

}

class AuthenticationInitialized extends AuthenticationState {

}

class AuthenticationUninitialized extends AuthenticationState {

}
