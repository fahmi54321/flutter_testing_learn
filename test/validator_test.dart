import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_learn/validator.dart';

void main() {
  //todo 2
  test('validasi untuk email kosong', () {
    // Arrange
    late var result;

    // Act
    result = Validator.validateEmail('');

    // Assert
    expect(result, 'Required Field');
  });

  //todo 3
  test('validasi email tidak valid', () {
    // Arrange
    late var result;

    // Act
    result = Validator.validateEmail('asaas');

    // Assert
    expect(result, 'Please enter a valid email');
  });

  //todo 4
  test('testing email valid', () {
    // Arrange
    late var result;

    // Act
    result = Validator.validateEmail('fahmi@gmail.com');

    // Assert
    expect(result, null);
  });

  //todo 5
  test('testing validate password kosong', () {
    // Arrange
    late var result;

    // Act
    result = Validator.validatePassword('');

    // Assert
    expect(result, 'Required Field');
  });

  //todo 6
  test('testing password tidak valid', () {
    // Arrange
    late var result;

    // Act
    result = Validator.validatePassword('12345');

    // Assert
    expect(result, 'Password harus lebih dari 6 karakter');
  });

  //todo 7 (finish)
  test('testing password valid', () {
    // Arrange
    late var result;

    // Act
    result = Validator.validatePassword('123456');

    // Assert
    expect(result, null);
  });
}
