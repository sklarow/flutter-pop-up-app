import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_pop_ups/main.dart';

void main() {
  testWidgets('App starts with PopupHandler', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that PopupHandler is the initial widget
    expect(find.byType(PopupHandler), findsOneWidget);
  });

  testWidgets('Login screen appears after popups', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp());

    // Initially should show loading screen
    expect(find.text('Loading...'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for popups to complete (simulate by pumping multiple frames)
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();

    // Should now show login screen
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Login with correct credentials', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp());

    // Wait for popups to complete
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();

    // Find and fill username field
    await tester.enterText(find.byType(TextField).first, 'qa');
    
    // Find and fill password field
    await tester.enterText(find.byType(TextField).last, 'qa');
    
    // Tap login button
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Should navigate to welcome screen (either old or new)
    expect(find.text('Welcome QA!'), findsOneWidget);
  });

  testWidgets('Login with incorrect credentials shows error', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp());

    // Wait for popups to complete
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();

    // Enter incorrect credentials
    await tester.enterText(find.byType(TextField).first, 'wrong');
    await tester.enterText(find.byType(TextField).last, 'wrong');
    
    // Tap login button
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Should show error message
    expect(find.text('Invalid username or password. Please try again.'), findsOneWidget);
  });
}
