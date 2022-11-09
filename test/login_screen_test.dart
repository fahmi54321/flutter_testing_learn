import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_learn/login_screen.dart';

void main() {
  //todo 1
  testWidgets('Testing temukan widget title', (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act --> temukan widget text dengan label "Login"
    Finder title = find.text('Login');

    // Assert
    expect(title, findsOneWidget);
  });

  //todo 2
  testWidgets('Testing temukan value key widget input email', (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act --> temukan value dengan label "email_field"
    Finder keyEmail = find.byKey(
      const ValueKey('email_field'),
    );

    // Assert
    expect(keyEmail, findsOneWidget);
  });

  //todo 3
  testWidgets('Testign temukan value key widget input password', (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act --> temukan value dengan label 'password_field'
    Finder keyPass = find.byKey(
      const ValueKey(
        'password_field',
      ),
    );

    // Assert
    expect(keyPass, findsOneWidget);
  });

  // todo 4 (finish)
  testWidgets('Testing temukan widget button', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act --> temukan elevatedbutton
    Finder findButton = find.byType(ElevatedButton);

    // Assert
    expect(findButton, findsOneWidget);
  });
}
