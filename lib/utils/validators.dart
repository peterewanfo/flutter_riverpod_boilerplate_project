class Validators {
  static String? validateEmail(String? email,
      {String error = "Enter a valid email address"}) {
    return isEmail(email)! ? null : error;
  }

  static bool? isEmail(String? email) {
    if (email != null) {
      String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
          "\\@" +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
          "(" +
          "\\." +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
          ")+";
      return new RegExp(p).hasMatch(email);
    }
    return null;
  }
}
