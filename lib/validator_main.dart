class ValidatorMain {
  RegExp regExpEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  String? isEmpty({String? value}) {
    if (value == null) {
      return 'Required Field';
    } else if (value.isEmpty) {
      return 'Required Field';
    } else {
      return null;
    }
  }

  String? isNotValidEmail({String? value}) {
    if (isEmpty(value: value) != null) {
      return 'Required Field';
    } else if (!regExpEmail.hasMatch(value!)) {
      return 'Please enter a valid email';
    } else if (regExpEmail.hasMatch(value)) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  String? isNotValidPassword({String? value}) {
    if (isEmpty(value: value) != null) {
      return 'Required Field';
    } else if ((value ?? '').length < 6) {
      return 'Password harus lebih dari 6 karakter';
    } else {
      return null;
    }
  }
}
