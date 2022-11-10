import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_learn/login_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Login flow test', () {
    //todo 4
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    //todo 5
    testWidgets('Testing pesan error ketika email dan password kosong',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act

      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(
        const Duration(seconds: 5),
      );

      // temukan text dihalaman home
      Finder errorText = find.text('Required Field');

      // Assert
      expect(
        errorText,
        findsNWidgets(2),
      );
    });

    //todo 6
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

    // todo 7 (finish)
    testWidgets(
        'Testing tampilkan halaman home ketika email dan password sudah valid',
        (WidgetTester tester) async {
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
      await tester.pumpAndSettle(
        const Duration(seconds: 5),
      );

      // temukan text dihalaman home
      Finder welcomeText = find.byType(Text);

      // Assert
      expect(welcomeText, findsOneWidget);
    });
  });
}
