class Constant {

  /*Image Urls*/
  static const String defaultImageUrl =
      "https://www.grad.edu.hk/sites/default/files/styles/feature_image_text_block/public/2018-09/iStock-629604122.jpg?itok=Ulxn4bJw";
  static const String defaultProfileAvatar =
      "https://www.pngjoy.com/pngm/804/9537968_avatar-web-developer-coder-avatar-hd-png-download.png";

  /*Shared Pref Keys*/
  static const String emailPrefs = "email-prefs";
  static const String usernamePrefs = "username-prefs";
  static const String passwordPrefs = "password-prefs";
  static const String isLoggedPrefs = "is-logged-prefs";

  static const int MEGABYTE = 1024 * 1024;

  /*RegEx*/
  static const String nameRegEx = '[a-zA-Z\\s]+';
  static const String emailRegEx = r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static const String passwordRegEx = '[0-9a-zA-Z]{4,}';
  static const String phoneRegEx = '(^(\\+88)?(01){1}[3456789]{1}(\\d){8})';

  /*Error Messages*/
  static const String emailErrorMessage = "Invalid email, make sure you have typed correctly!";
  static const String passwordEmptyMessage = "Password cannot be empty!";
  static const String passwordErrorMessage = "Password is too short, Need at least 4 characters!";
  static const String nameErrorMessage = "First name cannot be empty!";
  static const String phoneErrorMessage = "Invalid phone, make sure you have typed correctly!";
  static const String confirmPasswordEmptyMessage = "Confirm password cannot be empty!";
  static const String confirmPasswordErrorMessage = "Password does not match, make sure you have typed correctly!";
}
