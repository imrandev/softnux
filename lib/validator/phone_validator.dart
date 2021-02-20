import 'package:softnux/utils/constant.dart';

class PhoneValidator {

  static final PhoneValidator _instance = PhoneValidator._internal();

  final _phoneRegex = RegExp(
    Constant.phoneRegEx,
  );

  factory PhoneValidator() {
    return _instance;
  }

  PhoneValidator._internal();

  bool validate(String phone) {
    return _phoneRegex.hasMatch(phone);
  }
}