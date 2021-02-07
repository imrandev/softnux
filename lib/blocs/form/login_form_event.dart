part of 'login_form_bloc.dart';

@immutable
abstract class LoginFormEvent {
  const LoginFormEvent();
}

class PasswordVisibilityEvent extends LoginFormEvent {

  final bool visibility;
  final String password;

  const PasswordVisibilityEvent(this.visibility, this.password);

  List<Object> get props => [visibility, password];
}
