import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';
import '../models/popup_types.dart';
import '../widgets/footer_disclaimer.dart';
import '../screens/login_screen.dart';
import '../constants/automation_ids.dart';

class PopupHandler extends StatefulWidget {
  const PopupHandler({super.key});

  @override
  State<PopupHandler> createState() => _PopupHandlerState();
}

class _PopupHandlerState extends State<PopupHandler> {
  String selectedWelcomeScreen = 'old';
  bool popupsCompleted = false;

  @override
  void initState() {
    super.initState();
    _showPopups();
  }

  Future<void> _showPopups() async {
    // Create list of popups to show
    List<PopupType> popupsToShow = [PopupType.exit, PopupType.welcomeChoice];
    
    // Add optional popups with 30% chance each
    if (Random().nextDouble() < 0.3) {
      popupsToShow.add(PopupType.message1);
    }
    if (Random().nextDouble() < 0.3) {
      popupsToShow.add(PopupType.message2);
    }
    
    // Shuffle the list for random order
    popupsToShow.shuffle();
    
    // Show popups one by one with delay
    for (PopupType popupType in popupsToShow) {
      await Future.delayed(const Duration(milliseconds: 500)); // Loading delay
      await _showPopup(popupType);
    }
    
    setState(() {
      popupsCompleted = true;
    });
  }

  Future<void> _showPopup(PopupType popupType) async {
    switch (popupType) {
      case PopupType.exit:
        await _showExitPopup();
        break;
      case PopupType.welcomeChoice:
        await _showWelcomeChoicePopup();
        break;
      case PopupType.message1:
        await _showMessagePopup(
          'Inspirational Quote',
          'The only way to do great work is to love what you do. - Steve Jobs',
        );
        break;
      case PopupType.message2:
        await _showMessagePopup(
          'Motivational Message',
          'Success is not final, failure is not fatal: it is the courage to continue that counts. - Winston Churchill',
        );
        break;
    }
  }

  Future<void> _showExitPopup() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Semantics(
            key: const Key(AutomationIds.exitPopupTitle),
            label: AutomationIds.exitPopupTitle,
            excludeSemantics: true,
            child: const Text('Don\'t click in OK'),
          ),
            content: const Text('Clicking in OK will close the app'),
            actions: <Widget>[
            Semantics(
              label: AutomationIds.exitPopupCancel,
              excludeSemantics: true,
              child: TextButton(
                key: const Key(AutomationIds.exitPopupCancel),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Semantics(
              label: AutomationIds.exitPopupOk,
              excludeSemantics: true,
              child: TextButton(
                key: const Key(AutomationIds.exitPopupOk),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  SystemNavigator.pop(); // Close the app
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showWelcomeChoicePopup() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Semantics(
            key: const Key(AutomationIds.welcomeChoicePopupTitle),
            label: AutomationIds.welcomeChoicePopupTitle,
            excludeSemantics: true,
            child: const Text('Welcome screen:'),
          ),
            content: const Text('What welcome screen you want to see?'),
          actions: <Widget>[
            Semantics(
              label: AutomationIds.welcomeChoiceOld,
              excludeSemantics: true,
              child: TextButton(
                key: const Key(AutomationIds.welcomeChoiceOld),
                child: const Text('Old'),
                onPressed: () {
                  setState(() {
                    selectedWelcomeScreen = 'old';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
            Semantics(
              label: AutomationIds.welcomeChoiceNew,
              excludeSemantics: true,
              child: TextButton(
                key: const Key(AutomationIds.welcomeChoiceNew),
                child: const Text('New'),
                onPressed: () {
                  setState(() {
                    selectedWelcomeScreen = 'new';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMessagePopup(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Semantics(
            key: Key(title == 'Inspirational Quote' 
                ? AutomationIds.messagePopupTitle 
                : AutomationIds.messagePopupTitle2),
            label: title == 'Inspirational Quote' 
                ? AutomationIds.messagePopupTitle 
                : AutomationIds.messagePopupTitle2,
            excludeSemantics: true,
            child: Text(title),
          ),
            content: Text(message),
          actions: <Widget>[
            Semantics(
              label: AutomationIds.messagePopupDismiss,
              excludeSemantics: true,
              child: TextButton(
                key: const Key(AutomationIds.messagePopupDismiss),
                child: const Text('Dismiss'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!popupsCompleted) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      key: Key(AutomationIds.loadingIndicator),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Loading...',
                      key: Key(AutomationIds.loadingText),
                    ),
                  ],
                ),
              ),
            ),
            const FooterDisclaimer(),
          ],
        ),
      );
    }

    return LoginScreen(selectedWelcomeScreen: selectedWelcomeScreen);
  }
}
