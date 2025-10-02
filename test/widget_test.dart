import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_pop_ups/screens/login_screen.dart';
import 'package:flutter_application_pop_ups/screens/old_welcome_screen.dart';
import 'package:flutter_application_pop_ups/screens/new_welcome_screen.dart';
import 'package:flutter_application_pop_ups/widgets/footer_disclaimer.dart';
import 'package:flutter_application_pop_ups/constants/automation_ids.dart';

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
    expect(find.byKey(const Key(AutomationIds.loginButton)), findsOneWidget);
    expect(find.byKey(const Key(AutomationIds.usernameField)), findsOneWidget);
    expect(find.byKey(const Key(AutomationIds.passwordField)), findsOneWidget);
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
    final loginButton = find.byKey(const Key(AutomationIds.loginButton));
    await tester.ensureVisible(loginButton);
    await tester.pump();
    
    // Tap login button
    await tester.tap(loginButton, warnIfMissed: false);
    await tester.pump();

    // Should show error message
    expect(find.byKey(const Key(AutomationIds.errorMessage)), findsOneWidget);
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
    expect(find.byKey(const Key(AutomationIds.oldWelcomeLogout)), findsOneWidget);
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
    expect(find.byKey(const Key(AutomationIds.newWelcomeLogout)), findsOneWidget);
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
    expect(find.byKey(const Key(AutomationIds.linkedinLink)), findsOneWidget);
    expect(find.byKey(const Key(AutomationIds.githubLink)), findsOneWidget);
  });
}
