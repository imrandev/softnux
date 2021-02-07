part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class PasswordVisibilityState extends LoginState {
  final bool visibility;

  const PasswordVisibilityState(this.visibility);

  List<Object> get props => [visibility];
}
