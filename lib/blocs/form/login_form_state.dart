part of 'login_form_bloc.dart';

@immutable
abstract class LoginFormState {
  const LoginFormState();
}

class LoginFormInitial extends LoginFormState {
  final bool visibility;
  final String password;

  const LoginFormInitial(this.visibility, this.password);

  List<Object> get props => [visibility, password];
}

class PasswordVisibilityState extends LoginFormState {
  final bool visibility;
  final String password;

  const PasswordVisibilityState(this.visibility, this.password);

  List<Object> get props => [visibility, password];
}
