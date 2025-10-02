# Flutter Pop-up Challenge App

A Flutter application designed specifically for **mobile Android test automation** to simulate and handle random pop-up sequences that can cause test flakiness in automated testing scenarios.

## 🎯 Purpose

This app was created to **emulate asynchronous pop-up behavior** that commonly occurs in mobile applications, helping test automation engineers practice handling:

- **Random pop-up sequences** that appear in unpredictable order
- **Modal dialogs** that must be handled before continuing
- **Async operations** that can cause test instability
- **Timing-dependent interactions** that lead to flaky tests

## 🚀 Features

### Pop-up System
- **4 Different Pop-up Types** with varying behaviors
- **Random Order Generation** - pop-ups appear in completely random sequences
- **Conditional Appearance** - some pop-ups have 30% chance of appearing
- **Modal Behavior** - pop-ups must be handled before proceeding
- **App Closing Functionality** - simulates critical user actions

### Pop-up Types
1. **Exit Pop-up** - Closes the app (always appears)
2. **Welcome Screen Choice** - Select between old/new welcome screen (always appears)
3. **Generic Message Pop-ups** - Simple dismissible messages (30% chance each)

### User Interface
- **Modern Login Screen** with clean, professional design
- **Two Welcome Screens** with distinct styling
- **Responsive Design** that works on all screen sizes
- **Scrollable Content** to prevent overflow issues

## 🧪 Test Automation Challenge

This app presents a **realistic test automation challenge** where:

- Pop-ups appear **immediately on app startup**
- The **order is completely random** (e.g., 1-2-3-4, 3-1-2, 2-1-4-3)
- **Timing is unpredictable** - simulates real-world async operations
- **State management** is required to handle user choices
- **Error handling** is needed for different pop-up scenarios

### Why This Matters for Test Automation

- **Reduces Test Flakiness** by practicing with unpredictable UI elements
- **Improves Async Handling** skills for mobile test automation
- **Simulates Real-World Scenarios** where pop-ups appear randomly
- **Tests Robustness** of automation frameworks and scripts

## 📱 Screenshots

The app features a clean, modern interface with:
- Light grey background matching professional design standards
- Purple gradient login button for visual appeal
- Clean typography and spacing
- Responsive layout for different screen sizes

## 🛠️ Technical Details

### Built With
- **Flutter 3.35.5** - Cross-platform mobile development
- **Dart** - Programming language
- **Material Design** - UI components and theming
- **Cursor AI** - Developed with AI assistance for enhanced productivity

### Dependencies
- `url_launcher` - For opening external links
- `flutter_launcher_icons` - For generating app icons across platforms

### Architecture
- **StatefulWidget** for dynamic pop-up management
- **Random sequence generation** using `dart:math`
- **Modal dialog system** with proper state handling
- **Navigation management** with proper route handling

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.35.5 or higher
- Android Studio / VS Code with Flutter extensions
- Android device or emulator

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/sklarow/flutter-pop-up-app.git
   cd flutter-pop-up-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate app icons:
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

4. Run the app:
   ```bash
   flutter run
   ```

### Login Credentials
- **Username**: `qa`
- **Password**: `qa`

## 🧪 Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 📦 Building APK

```bash
# Build release APK
flutter build apk --release

# APK will be generated at:
# build/app/outputs/flutter-apk/app-release.apk
```

## 🤖 CI/CD Pipeline

This project includes **GitHub Actions** for automated:
- **Testing** on every push and pull request
- **APK Building** for release distribution
- **Automatic Releases** with downloadable APK files
- **Cross-platform Icon Generation**

## 📋 Test Scenarios

### Manual Testing
1. **Launch the app** - Pop-ups will appear immediately
2. **Handle pop-ups** in the order they appear
3. **Test different sequences** by restarting the app
4. **Verify navigation** to correct welcome screen
5. **Test app closing** functionality

### Automated Testing Challenges
- **Random pop-up handling** - Scripts must be robust
- **Timing management** - Wait for pop-ups to appear
- **State persistence** - Remember user choices
- **Error recovery** - Handle unexpected pop-up sequences


## 🔗 Links

- **Developer**: [Allan Sklarow](https://www.linkedin.com/in/sklarow/)
- **GitHub Repository**: [flutter-pop-up-app](https://github.com/sklarow/flutter-pop-up-app/)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 🙏 Acknowledgments

- **Flutter Team** for the amazing cross-platform framework
- **Cursor AI** for AI-powered development assistance
- **Material Design** for beautiful UI components
- **Test Automation Community** for inspiration and feedback

---

**Made with ❤️ and Cursor AI** for the test automation community

*This app is designed to help test automation engineers practice handling unpredictable UI elements and improve the robustness of their automated tests.*