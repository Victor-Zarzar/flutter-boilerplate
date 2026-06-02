<h1 align="center" id="header">
  Flutter Multi-Platform Boilerplate
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Flutter-3.41.9-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Material_Design_3-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design 3">
  <img src="https://img.shields.io/badge/MVVM-Architecture-blueviolet?style=for-the-badge" alt="MVVM">
  <img src="https://img.shields.io/badge/Provider-State_Management-orange?style=for-the-badge" alt="Provider">
</p>

<p align="center">
  A basic multi-platform Flutter boilerplate for mobile and web. Built with MVVM architecture, featuring i18n, Dark Mode, GoRouter, Notifications, Provider, Responsive layout, Sentry, Google Fonts, and Material Design 3.
</p>

---

<h2 id="stack">Tech Stack</h2>

<p>
  <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/Dart-Dark.svg" width="48" title="Dart">
  <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/Flutter-Dark.svg" width="48" title="Flutter">
  <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/AndroidStudio-Dark.svg" width="48" title="Android Studio">
  <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/Sentry.svg" width="48" title="Sentry">
  <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/Figma-Dark.svg" width="48" title="Figma">
</p>

### Core Technologies

- **Dart** - Programming language
- **Flutter** - Cross-platform UI framework
- **Material Design 3** - Modern design system
- **MVVM** - Architecture pattern (Model - View - ViewModel)
- **Provider** - State management solution

### Features & Integrations

- **Multi-Platform Support** - Android, iOS, Web
- **Google Fonts** - Beautiful typography
- **i18n** - Multi-language support (EN / PT-BR / ES)
- **Dark Mode Provider** - Theme switching
- **GoRouter** - Declarative routing with adaptive navigation (mobile/web)
- **Flutter Local Notifications** - Push notifications
- **Toast Notification** - Lightweight in-app feedback messages
- **Responsive Layout** - Adaptive UI for mobile and web
- **Sentry Logs** - Error tracking and monitoring
- **Skeleton** - Skeleton Wrapper Widget Animation
- **URL Launcher** - Smart URL, phone, and WhatsApp link handling
- **Version Update** - In-app update checks for App Store and Play Store
- **HTTP Service** - Centralized REST client with logging
- **Internet Connection** - Real-time connectivity detection
- **App Logger** - Structured, color-coded debug logging
- **Robots.txt & Sitemap.xml** - SEO-ready web configuration included

---

<h2 id="prerequisites">Prerequisites</h2>

Before starting, ensure you have the following installed:

- [FVM (Flutter Version Management)](https://fvm.app/documentation/getting-started/installation) - Required for managing Flutter versions
- [Git](https://git-scm.com/)
- [Xcode](https://developer.apple.com/xcode/) (for iOS development on macOS)
- [Android Studio](https://developer.android.com/studio) (for Android development)

> **Note**: This project uses FVM for Flutter version management. You don't need to install Flutter globally.

> Optional: [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio) with Flutter plugins for IDE support.

---

<h2 id="installation">Installation & Setup</h2>

### 1. Clone the Repository (Template)

```bash
git clone https://github.com/Victor-Zarzar/flutter-boilerplate.git my_app
cd my_app
flutter pub get
```

### 2. Open in your editor (example: Zed Editor)

```bash
zed .
```

### 3. Install Dependencies

```bash
flutter pub get
```

---

<h2 id="usage">Usage</h2>

### Local Development

#### Mobile (iOS Simulator)

```bash
make run-ios
```

### Inspect Devtools

```bash
dart devtools
```

#### Web (Google Chrome)

```bash
make run-chrome
```

#### Or Web Server default

```bash
make run-web-server
```

Access the application at `http://localhost:xxxx`

---

<h2 id="development">Development</h2>

### Code Analysis

Check for code issues:

```bash
flutter analyze
```

### Testing

Run all tests:

```bash
flutter test
```

### Format Code

Format all files:

```bash
dart format .
```

---

<h2 id="deployment">Deployment</h2>

### Android (Google Play Store)

Build release APK:

```bash
flutter build apk --release
```

Build release AppBundle:

```bash
flutter build appbundle --release
```

The generated files will be at:

- APK: `build/app/outputs/flutter-apk/app-release.apk`
- AppBundle: `build/app/outputs/bundle/release/app-release.aab`

### iOS (App Store)

```bash
flutter build ios --release
```

The generated files will be at:

- IPA: `build/ios/ipa/`

### Web

```bash
flutter build web --release
```

The generated files will be at: `build/web/`

### With Sentry Monitoring

For all platforms, pass your DSN as an environment variable:

```bash
SENTRY_DSN=your-dsn-here flutter build apk --release
SENTRY_DSN=your-dsn-here flutter build ios --release
SENTRY_DSN=your-dsn-here flutter build web --release
```

### Sentry Configuration

All production builds include:

- **Error tracking** with Sentry DSN
- **Code obfuscation** for security
- **Debug symbols** upload for crash symbolication

Make sure to:

1. Set your `SENTRY_DSN` from your Sentry project
2. Upload debug symbols to Sentry after each release for proper stack traces
3. Keep `build/debug-info/` directory for symbolication

---

<h2 id="contributing">Contributing</h2>

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

<h2 id="license">License</h2>

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<h2 id="contact">Contact</h2>

Victor Zarzar - [@Victor-Zarzar](https://github.com/Victor-Zarzar)

Project Link: [https://github.com/Victor-Zarzar/flutter-boilerplate](https://github.com/Victor-Zarzar/flutter-boilerplate)

---
