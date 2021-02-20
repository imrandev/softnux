class InputField {
  String message;
  bool validate = false;

  InputField(this.message, this.validate);

  String get errorMessage => message;
}

class NameInputField extends InputField  {
  NameInputField(String message, bool validate) : super(message, validate);
}

class PhoneInputField extends InputField  {
  PhoneInputField(String message, bool validate) : super(message, validate);
}

class PasswordInputField extends InputField  {
  bool visibility = false;
  PasswordInputField(String message, bool validate, this.visibility) : super(message, validate);

  bool get passwordVisibility => visibility;
}

class ConfirmPasswordInputField extends PasswordInputField  {
  ConfirmPasswordInputField(String message, bool validate, bool passwordVisibility) : super(message, validate, passwordVisibility);
}

class EmailInputField extends InputField  {
  EmailInputField(String message, bool validate) : super(message, validate);
}

class FormData {
  final NameInputField _nameInputField = NameInputField(null, false);
  final PasswordInputField _passwordInputField = PasswordInputField(null, false, false);
  final PhoneInputField _phoneInputField = PhoneInputField(null, false);
  final ConfirmPasswordInputField _confirmPasswordField = ConfirmPasswordInputField(null, false, false);
  final EmailInputField _emailInputField = EmailInputField(null, false);

  NameInputField get nameInputField => _nameInputField;
  PasswordInputField get passwordInputField => _passwordInputField;
  PhoneInputField get phoneInputField => _phoneInputField;
  ConfirmPasswordInputField get confirmInputField => _confirmPasswordField;
  EmailInputField get emailInputField => _emailInputField;
}