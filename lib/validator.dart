//todo 1 create method validator (next validator_test.dart)

class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Required Field';
    }

    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(email)) {
      return 'Please enter a valid email';
    }
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Required Field';
    }

    if (password.length < 6) {
      return 'Password harus lebih dari 6 karakter';
    }
  }
}
