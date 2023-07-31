//todo 1 create method validator (next validator_test.dart)

import 'package:flutter_testing_learn/validator_main.dart';

class Validator extends ValidatorMain {
  String? validateEmail(String email) {
    return isNotValidEmail(value: email);
  }

  String? validatePassword(String password) {
    return isNotValidPassword(value: password);
  }
}
