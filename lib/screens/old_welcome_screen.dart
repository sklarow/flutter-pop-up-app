import 'package:flutter/material.dart';
import '../widgets/footer_disclaimer.dart';
import '../widgets/popup_handler.dart';
import '../constants/automation_ids.dart';

class OldWelcomeScreen extends StatelessWidget {
  const OldWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orange,
                    Colors.deepOrange,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.waving_hand,
                      size: 100,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Welcome QA!',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'serif',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'You are seeing the old welcome screen!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'serif',
                      ),
                    ),
                    const SizedBox(height: 48),
                    ElevatedButton(
                      key: const Key(AutomationIds.oldWelcomeLogout),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const PopupHandler()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const FooterDisclaimer(),
        ],
      ),
    );
  }
}
