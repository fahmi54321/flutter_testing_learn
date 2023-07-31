import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_learn/validator.dart';
import 'package:flutter_testing_learn/validator_main.dart';

void main() {
  ValidatorMain validatorMain = ValidatorMain();
  Validator validator = Validator();

  //todo 2
  test('validasi untuk email kosong', () {
    // Arrange
    late String? result;

    // Act
    result = validator.validateEmail('');

    // Assert
    expect(result, 'Required Field');
  });

  //todo 3
  test('validasi email tidak valid', () {
    // Arrange
    late String? result;

    // Act
    result = validator.validateEmail('asaas');

    // Assert
    expect(result, 'Please enter a valid email');
  });

  //todo 4
  test('testing email valid', () {
    // Arrange
    late String? result;

    // Act
    result = validator.validateEmail('fahmi@gmail.com');

    // Assert
    expect(result, null);
  });

  //todo 5
  test('testing validate password kosong', () {
    // Arrange
    late String? result;

    // Act
    result = validator.validatePassword('');

    // Assert
    expect(result, 'Required Field');
  });

  //todo 6
  test('testing password tidak valid', () {
    // Arrange
    late String? result;

    // Act
    result = validator.validatePassword('12345');

    // Assert
    expect(result, 'Password harus lebih dari 6 karakter');
  });

  //todo 7
  test('testing password valid', () {
    // Arrange
    late String? result;

    // Act
    result = validator.validatePassword('123456');

    // Assert
    expect(result, null);
  });

  //todo 8 (finish)
  group('testing validator is empty', () {
    test('testing validator empty valid', () {
      // Arrange
      String? value = 'value';

      // Act
      final valid = validatorMain.isEmpty(value: value);

      // Assert
      expect(valid, null);
    });

    test('testing validator empty not valid', () {
      // Arrange
      String? value;

      // Act
      final valid = validatorMain.isEmpty(value: value);

      // Assert
      expect(valid, 'Required Field');
    });
  });

  group('testing validator email', () {
    test('testing valid email is true', () {
      // Arrange
      String? value = 'email@gmail.com';

      // Act
      final valid = validatorMain.isNotValidEmail(value: value);

      // Assert
      expect(valid, null);
    });

    test('testing valid email is false part 1', () {
      // Arrange
      String? value = 'email@gmailcom';

      // Act
      final valid = validatorMain.isNotValidEmail(value: value);

      // Assert
      expect(valid, 'Please enter a valid email');
    });

    test('testing valid email is false part 2', () {
      // Arrange
      String? value;

      // Act
      final valid = validatorMain.isNotValidEmail(value: value);

      // Assert
      expect(valid, 'Required Field');
    });
  });

  group('testing validator password', () {
    test('testing valid password is true', () {
      // Arrange
      String? value = '1234567';

      // Act
      final valid = validatorMain.isNotValidPassword(value: value);

      // Assert
      expect(valid, null);
    });

    test('testing valid password is false part 1', () {
      // Arrange
      String? value;

      // Act
      final valid = validatorMain.isNotValidPassword(value: value);

      // Assert
      expect(valid, 'Required Field');
    });

    test('testing valid password is false part 2', () {
      // Arrange
      String? value = '12345';

      // Act
      final valid = validatorMain.isNotValidPassword(value: value);

      // Assert
      expect(valid, 'Password harus lebih dari 6 karakter');
    });
  });
}
