import 'package:softnux/utils/constant.dart';

class EmailValidator {

  static final EmailValidator _instance = EmailValidator._internal();

  factory EmailValidator() {
    return _instance;
  }

  EmailValidator._internal();

  final _emailRegex = RegExp(
    Constant.emailRegEx,
  );

  bool validate(String email){
    return _emailRegex.hasMatch(email);
  }
}