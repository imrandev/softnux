part of 'auth_form_bloc.dart';

@immutable
abstract class AuthFormState {
  const AuthFormState();
}

class AuthFormInitial extends AuthFormState {

}

class PasswordVisibilityState extends AuthFormState {
  final bool visibility;

  const PasswordVisibilityState(this.visibility);

  List<Object> get props => [visibility];
}

class ConfirmPasswordVisibilityState extends AuthFormState {
  final bool visibility;

  const ConfirmPasswordVisibilityState(this.visibility);

  List<Object> get props => [visibility];
}

class NameValidatorState extends AuthFormState {
  final bool validate;
  final String errorMessage;

  NameValidatorState({this.validate, this.errorMessage});

  List<Object> get props => [validate, errorMessage];
}

class EmailValidatorState extends AuthFormState {
  final bool validate;
  final String errorMessage;

  EmailValidatorState({this.validate, this.errorMessage});

  List<Object> get props => [validate, errorMessage];
}

class PasswordValidatorState extends AuthFormState {
  final bool validate;
  final String errorMessage;

  PasswordValidatorState({this.validate, this.errorMessage});

  List<Object> get props => [validate, errorMessage];
}

class ConfirmPasswordValidatorState extends AuthFormState {
  final bool validate;
  final String errorMessage;

  ConfirmPasswordValidatorState({this.validate, this.errorMessage});

  List<Object> get props => [validate, errorMessage];
}

class PhoneValidatorState extends AuthFormState {
  final bool validate;
  final String errorMessage;

  PhoneValidatorState({this.validate, this.errorMessage});

  List<Object> get props => [validate, errorMessage];
}
