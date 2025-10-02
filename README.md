# Flutter Pop-up Challenge App

A Flutter application designed specifically for **mobile Android test automation** to simulate and handle random pop-up sequences that can cause test flakiness in automated testing scenarios.

## 🎯 Purpose

This app was created to **emulate asynchronous pop-up behavior** that commonly occurs in mobile applications, helping test automation engineers practice handling:

- **Random pop-up sequences** that appear in unpredictable order
- **Modal dialogs** that must be handled before continuing
- **Async operations** that can cause test instability
- **Timing-dependent interactions** that lead to flaky tests


## 📋 Test Scenarios

### Manual Testing
- **Launch app** → Random pop-ups appear immediately
- **Handle pop-ups** in unpredictable order
- **Restart app** → Different pop-up sequence each time
- **Verify navigation** to selected welcome screen

### Automated Testing Challenges
- **Random pop-up handling** - Scripts must be robust to any sequence
- **Timing management** - Wait for pop-ups to appear before interaction
- **State persistence** - Remember user choices across pop-ups
- **Error recovery** - Handle unexpected pop-up combinations

### Real-World Conditional Pop-ups
This app simulates real scenarios where, for example, pop-ups depend on device capabilities:

**✅ Will Appear:**
- User has biometrics enabled → Biometric authentication pop-up
- Location services enabled → Location permission dialog
- Camera available → Camera permission request
- Network connected → Update available notification

**❌ Won't Appear:**
- No biometrics configured → Biometric pop-up skipped
- Location disabled → No location permission dialog
- No camera hardware → Camera permission never shown
- Airplane mode → Network-related pop-ups absent

**💡 Note:** While these scenarios could be easily handled with feature flags in controlled environments, test automation engineers often work with **third-party apps, legacy systems, or software they don't control** - making robust pop-up handling essential for reliable test execution.

## 🧪 Why This Matters for Test Automation

- **Reduces Test Flakiness** by practicing with unpredictable UI elements
- **Improves Async Handling** skills for mobile test automation
- **Simulates Real-World Scenarios** where pop-ups appear randomly
- **Tests Robustness** of automation frameworks and scripts

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

## 🤖 CI/CD Pipeline

This project includes **GitHub Actions** for automated:
- **Testing** on every push and pull request
- **APK Building** for release distribution
- **Automatic Releases** with downloadable APK files
- **Cross-platform Icon Generation**

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