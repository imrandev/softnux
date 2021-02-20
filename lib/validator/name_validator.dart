import 'package:softnux/utils/constant.dart';

class NameValidator {

  static final NameValidator _instance = NameValidator._internal();

  final _nameRegex = RegExp(
    Constant.nameRegEx,
  );

  factory NameValidator() {
    return _instance;
  }

  NameValidator._internal();

  bool validate(String name) {
    return _nameRegex.hasMatch(name);
  }
}