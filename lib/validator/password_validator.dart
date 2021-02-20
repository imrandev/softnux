import 'package:softnux/utils/constant.dart';

class PasswordValidator {

  static final PasswordValidator _instance = PasswordValidator._internal();

  final _passwordRegex = RegExp(
    Constant.passwordRegEx,
  );

  factory PasswordValidator() {
    return _instance;
  }

  PasswordValidator._internal();

  bool validate(String password) {
    return _passwordRegex.hasMatch(password);
  }
}