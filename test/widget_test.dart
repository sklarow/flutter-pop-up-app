import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_pop_ups/main.dart';

void main() {
  testWidgets('Login screen has correct elements', (WidgetTester tester) async {
    // Create a LoginScreen widget directly for testing
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(selectedWelcomeScreen: 'old'),
      ),
    );

    // Verify login screen elements exist
    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Pop-up Challenge - Login'), findsOneWidget);
    expect(find.byKey(const Key('login_button')), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(FooterDisclaimer), findsOneWidget);
  });

  testWidgets('Login with incorrect credentials shows error', (WidgetTester tester) async {
    // Create a LoginScreen widget directly for testing
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(selectedWelcomeScreen: 'old'),
      ),
    );

    // Enter incorrect credentials
    await tester.enterText(find.byType(TextField).first, 'wrong');
    await tester.enterText(find.byType(TextField).last, 'wrong');
    
    // Find the login button by key
    final loginButton = find.byKey(const Key('login_button'));
    await tester.ensureVisible(loginButton);
    await tester.pump();
    
    // Tap login button
    await tester.tap(loginButton, warnIfMissed: false);
    await tester.pump();

    // Should show error message
    expect(find.text('Invalid username or password. Please try again.'), findsOneWidget);
  });

  testWidgets('Old welcome screen has correct elements', (WidgetTester tester) async {
    // Create OldWelcomeScreen widget directly for testing
    await tester.pumpWidget(
      MaterialApp(
        home: const OldWelcomeScreen(),
      ),
    );

    // Verify old welcome screen elements exist
    expect(find.text('Welcome QA!'), findsOneWidget);
    expect(find.text('You are seeing the old welcome screen!'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Logout'), findsOneWidget);
    expect(find.byType(FooterDisclaimer), findsOneWidget);
  });

  testWidgets('New welcome screen has correct elements', (WidgetTester tester) async {
    // Create NewWelcomeScreen widget directly for testing
    await tester.pumpWidget(
      MaterialApp(
        home: const NewWelcomeScreen(),
      ),
    );

    // Verify new welcome screen elements exist
    expect(find.text('Welcome QA!'), findsOneWidget);
    expect(find.text('You are seeing the new welcome screen!'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Logout'), findsOneWidget);
    expect(find.byType(FooterDisclaimer), findsOneWidget);
  });

  testWidgets('Footer disclaimer has correct content', (WidgetTester tester) async {
    // Create a LoginScreen widget directly for testing
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(selectedWelcomeScreen: 'old'),
      ),
    );

    // Verify footer disclaimer elements exist
    expect(find.text('Developed by Allan Sklarow'), findsOneWidget);
    expect(find.text('LinkedIn Profile'), findsOneWidget);
    expect(find.text('GitHub Repository'), findsOneWidget);
  });
}
