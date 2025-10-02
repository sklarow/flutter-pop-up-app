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
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('Login with correct credentials navigates to welcome screen', (WidgetTester tester) async {
    // Create a LoginScreen widget directly for testing
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(selectedWelcomeScreen: 'old'),
      ),
    );

    // Find and fill username field
    await tester.enterText(find.byType(TextField).first, 'qa');
    
    // Find and fill password field
    await tester.enterText(find.byType(TextField).last, 'qa');
    
    // Tap login button using the button widget instead of text
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Should navigate to old welcome screen
    expect(find.text('Welcome QA!'), findsOneWidget);
    expect(find.text('You are seeing the old welcome screen!'), findsOneWidget);
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
    
    // Tap login button using the button widget instead of text
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Should show error message
    expect(find.text('Invalid username or password. Please try again.'), findsOneWidget);
  });

  testWidgets('New welcome screen choice works', (WidgetTester tester) async {
    // Create a LoginScreen widget with new welcome screen choice
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(selectedWelcomeScreen: 'new'),
      ),
    );

    // Login with correct credentials
    await tester.enterText(find.byType(TextField).first, 'qa');
    await tester.enterText(find.byType(TextField).last, 'qa');
    
    // Tap login button using the button widget instead of text
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Should navigate to new welcome screen
    expect(find.text('Welcome QA!'), findsOneWidget);
    expect(find.text('You are seeing the new welcome screen!'), findsOneWidget);
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
  });
}
