import 'package:shared_preferences/shared_preferences.dart';
import 'package:softnux/utills/constant.dart';

class PrefsUtil {
  static final PrefsUtil _instance = PrefsUtil._internal();

  factory PrefsUtil() {
    return _instance;
  }

  PrefsUtil._internal();

  void saveUsername(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constant.usernamePrefs, data);
  }

  void savePassword(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constant.passwordPrefs, data);
  }

  void saveSession(bool loggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(Constant.isLoggedPrefs, loggedIn);
  }

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constant.usernamePrefs);
  }

  Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constant.passwordPrefs);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constant.isLoggedPrefs);
  }

  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }
}