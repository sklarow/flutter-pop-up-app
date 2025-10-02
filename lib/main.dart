import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pop-up App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PopupHandler(),
    );
  }
}

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
          title: const Text('Don\'t click in OK'),
          content: const Text('Clicking in OK will close the app'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop(); // Close the app
              },
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
          title: const Text('Welcome screen:'),
          content: const Text('What welcome screen you want to see?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Old'),
              onPressed: () {
                setState(() {
                  selectedWelcomeScreen = 'old';
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('New'),
              onPressed: () {
                setState(() {
                  selectedWelcomeScreen = 'new';
                });
                Navigator.of(context).pop();
              },
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
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!popupsCompleted) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading...'),
            ],
          ),
        ),
      );
    }

    return LoginScreen(selectedWelcomeScreen: selectedWelcomeScreen);
  }
}

enum PopupType {
  exit,
  welcomeChoice,
  message1,
  message2,
}

class LoginScreen extends StatefulWidget {
  final String selectedWelcomeScreen;
  
  const LoginScreen({super.key, required this.selectedWelcomeScreen});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username == 'qa' && password == 'qa') {
      // Navigate to selected welcome screen
      if (widget.selectedWelcomeScreen == 'new') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NewWelcomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OldWelcomeScreen()),
        );
      }
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_outline,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 32),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 48),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            if (_errorMessage != null)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  border: Border.all(color: Colors.red.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hint: Use "qa" as both username and password',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

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
      body: Container(
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
    );
  }
}

class NewWelcomeScreen extends StatelessWidget {
  const NewWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple,
              Colors.deepPurple,
              Colors.indigo,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.star,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Welcome QA!',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'monospace',
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'You are seeing the new welcome screen!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: 'monospace',
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const PopupHandler()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
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
    );
  }
}
