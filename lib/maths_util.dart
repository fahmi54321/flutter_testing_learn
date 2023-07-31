//todo 1 method yg ingin di test (next maths_util_test.dart)

import 'package:flutter_testing_learn/imaths_util.dart';
import 'package:flutter_testing_learn/validator.dart';

class Calculate extends Validator implements ICalculate {
  @override
  int? kali({int? a, int? b}) {
    if (isValidNumber(a: a, b: b)) {
      return a! * b!;
    } else {
      return null;
    }
  }

  @override
  int? kurang({int? a, int? b}) {
    if (isValidNumber(a: a, b: b)) {
      return a! - b!;
    } else {
      return null;
    }
  }

  @override
  int? tambah({int? a, int? b}) {
    if (isValidNumber(a: a, b: b)) {
      return a! + b!;
    } else {
      return null;
    }
  }
}
