import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_learn/login_screen.dart';

void main() {
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

  //todo 1
  testWidgets('Testing harus ada pesan required jika email dan password kosong',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act
    Finder loginButton = find.byType(ElevatedButton); // temukan button
    await tester.tap(loginButton); // ketika onTap
    await tester
        .pumpAndSettle(); // settle berarti mengatasi ketika klik onTap akan ada waktu yg dibutuhkan
    Finder errorText = find.text('Required Field'); // temukan error text

    // Assert
    expect(errorText, findsNWidgets(2)); //  cek dua widget untuk error text
  });

  //todo 2
  testWidgets('Testing email tidak valid', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act

    // temukan key input email
    Finder keyEmail = find.byKey(
      const ValueKey('email_field'),
    );

    // simulai input email salah
    await tester.enterText(keyEmail, 'fahmigmail.com');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // pesan text ketika email tidak valid
    Finder errorText = find.text('Please enter a valid email');

    // Assert
    expect(errorText, findsOneWidget);
  });

  // todo 3
  testWidgets('Testing password tidak valid', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act

    // temukan key input password
    Finder keyPass = find.byKey(
      const ValueKey('password_field'),
    );

    // simulasi input password salah
    await tester.enterText(keyPass, '123');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // pesan text ketika password tidak valid
    Finder errorText = find.text('Password harus lebih dari 6 karakter');

    // Assert
    expect(errorText, findsOneWidget);
  });

  //todo 4 (finish)
  testWidgets('Testign email dan password valid', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act

    // temukan key input
    Finder keyEmail = find.byKey(
      const ValueKey('email_field'),
    );
    Finder keyPass = find.byKey(
      const ValueKey('password_field'),
    );

    // simulai input valid
    await tester.enterText(keyEmail, 'fahmi@gmail.com');
    await tester.enterText(keyPass, '123456789');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // pesan text input kosong
    Finder errorText = find.text('Required Field');

    // Assert
    expect(errorText, findsNothing);
  });
}
