part of 'auth_form_bloc.dart';

enum FormFieldStatus {
  invalid, valid
}

@immutable
abstract class AuthFormEvent {
  const AuthFormEvent();
}

class PasswordVisibilityEvent extends AuthFormEvent {
  final bool visibility;

  const PasswordVisibilityEvent(this.visibility);

  List<Object> get props => [visibility];
}

class ConfirmPasswordVisibilityEvent extends AuthFormEvent {
  final bool visibility;

  const ConfirmPasswordVisibilityEvent(this.visibility);

  List<Object> get props => [visibility];
}

class EmailChangeEvent extends AuthFormEvent {
  final String email;

  EmailChangeEvent(this.email);

  List<Object> get props => [email];
}

class PasswordChangeEvent extends AuthFormEvent {
  final String password;

  PasswordChangeEvent(this.password);

  List<Object> get props => [password];
}

class ConfirmPasswordChangeEvent extends AuthFormEvent {
  final String password;
  final String confirmPassword;

  ConfirmPasswordChangeEvent(this.password, this.confirmPassword);

  List<Object> get props => [password, confirmPassword];
}

class NameChangeEvent extends AuthFormEvent {
  final String name;

  NameChangeEvent(this.name);

  List<Object> get props => [name];
}

class PhoneChangeEvent extends AuthFormEvent {
  final String phone;

  PhoneChangeEvent(this.phone);

  List<Object> get props => [phone];
}