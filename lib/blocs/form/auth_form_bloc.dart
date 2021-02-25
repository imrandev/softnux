import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:softnux/utils/constant.dart';
import 'package:softnux/validator/email_validator.dart';
import 'package:softnux/validator/name_validator.dart';
import 'package:softnux/validator/password_validator.dart';
import 'package:softnux/validator/phone_validator.dart';

part 'auth_form_event.dart';

part 'auth_form_state.dart';

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc() : super(AuthFormInitial());

  @override
  Stream<AuthFormState> mapEventToState(AuthFormEvent event) async* {
    if (event is PasswordVisibilityEvent) {
      yield PasswordVisibilityState(event.visibility);
    } else if (event is ConfirmPasswordVisibilityEvent) {
      yield ConfirmPasswordVisibilityState(event.visibility);
    } else if (event is NameChangeEvent) {
      bool validate = NameValidator().validate(event.name);
      yield NameValidatorState(
        validate: validate,
        errorMessage: !validate ? Constant.nameErrorMessage : null,
      );
    } else if (event is PasswordChangeEvent) {
      bool validate = PasswordValidator().validate(event.password);
      if (event.password.isEmpty) {
        yield PasswordValidatorState(
          validate: validate,
          errorMessage: Constant.passwordEmptyMessage,
        );
      } else {
        yield PasswordValidatorState(
          validate: validate,
          errorMessage: !validate ? Constant.passwordErrorMessage : null,
        );
      }
    } else if (event is EmailChangeEvent) {
      bool validate = EmailValidator().validate(event.email);
      yield EmailValidatorState(
        validate: validate,
        errorMessage: !validate ? Constant.emailErrorMessage : null,
      );
    } else if (event is PhoneChangeEvent) {
      bool validate = PhoneValidator().validate(event.phone);
      yield PhoneValidatorState(
        validate: validate,
        errorMessage: !validate ? Constant.phoneErrorMessage : null,
      );
    } else if (event is ConfirmPasswordChangeEvent) {
      bool validate = false;
      if (event.confirmPassword.isEmpty) {
        yield ConfirmPasswordValidatorState(
          validate: false,
          errorMessage: event.password.isNotEmpty
              && event.hasFocus ? "Confirm password cannot be empty" : null,
        );
      } else {
        validate = event.password.isNotEmpty
            && event.confirmPassword.isNotEmpty
            && event.password == event.confirmPassword && event.password.length > 3;

        yield ConfirmPasswordValidatorState(
          validate: validate,
          errorMessage: !validate
              ? Constant.confirmPasswordErrorMessage
              : null,
        );
      }
    }
  }
}
