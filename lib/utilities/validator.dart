import 'string_util.dart';

class Validator {
  static String? validateEmail(String? s) {
    if (StringUtil.isEmpty(s)) {
      return 'Email cannot be empty';
    } else if (!StringUtil.isValidEmail(s!)) {
      return 'The inputted email is not valid';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? s) {
    if (StringUtil.isEmpty(s)) {
      return 'Password cannot be empty';
    } else if (s!.length < 4) {
      return 'Password must be greater than four';
    } else {
      return null;
    }
  }
}
