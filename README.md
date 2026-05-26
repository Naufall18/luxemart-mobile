# 📱 LuxeMart Mobile App (Flutter)

Premium Multi-Vendor Marketplace Mobile Application

## 🎯 Overview

Cross-platform mobile app for iOS and Android built with Flutter, providing seamless luxury shopping experience with native performance.

## ✨ Features

### Buyer Features
- Multi-method authentication (Email, Phone, OAuth, Biometric)
- Advanced product search with AI recommendations
- AR Try-On for applicable products
- Live shopping sessions with real-time chat
- Multi-vendor cart & wishlist
- Multiple payment methods & installment plans
- Real-time order tracking with live map
- In-app chat with sellers
- Loyalty program & referral system
- Push notifications

### Seller Features
- Vendor dashboard with analytics
- Product & inventory management
- Order processing
- Live shopping studio
- Customer chat
- Earnings & payout management

## 🛠️ Tech Stack

- **Framework:** Flutter 3.16+
- **Language:** Dart 3.2+
- **State Management:** Riverpod / Bloc
- **Navigation:** Go Router
- **UI Components:** Material 3 / Custom widgets
- **API Client:** Dio
- **Real-time:** Socket.io Client
- **Local Storage:** Hive / Shared Preferences
- **Maps:** Google Maps Flutter
- **Camera:** Camera Plugin
- **Push Notifications:** Firebase Cloud Messaging
- **Payment:** Stripe Flutter SDK / Midtrans
- **AR:** ARCore (Android) / ARKit (iOS)

## 🚀 Getting Started

### Prerequisites

```bash
Flutter SDK >= 3.16.0
Dart SDK >= 3.2.0
Android Studio / Xcode
```

### iOS Requirements
```bash
Xcode >= 14.0
CocoaPods >= 1.12.0
iOS >= 13.0
```

### Android Requirements
```bash
Android Studio
JDK >= 11
Android SDK >= 31 (API Level 31)
```

### Installation

```bash
# Clone repository
git clone https://github.com/yourusername/luxemart-mobile.git
cd luxemart-mobile

# Install dependencies
flutter pub get

# Setup environment
cp .env.example .env

# Check Flutter setup
flutter doctor
```

### Running the App

```bash
# Run on connected device
flutter run

# Run on specific device
flutter devices
flutter run -d <device-id>

# Run on iOS simulator
flutter run -d ios

# Run on Android emulator
flutter run -d android

# Run with hot reload
flutter run --hot
```

## 📁 Project Structure

```
luxemart-mobile/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── app.dart                  # App configuration
│   ├── core/
│   │   ├── constants/           # App constants
│   │   ├── theme/               # App theme
│   │   ├── utils/               # Utility functions
│   │   ├── routes/              # Navigation routes
│   │   └── config/              # App configuration
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/           # Data layer
│   │   │   ├── domain/         # Business logic
│   │   │   └── presentation/   # UI layer
│   │   ├── home/
│   │   ├── product/
│   │   ├── cart/
│   │   ├── order/
│   │   ├── profile/
│   │   ├── vendor/
│   │   └── ...
│   ├── shared/
│   │   ├── widgets/            # Reusable widgets
│   │   ├── models/             # Shared models
│   │   └── services/           # Shared services
│   └── l10n/                   # Localization
├── assets/
│   ├── images/
│   ├── icons/
│   └── fonts/
├── test/                       # Unit tests
├── integration_test/           # Integration tests
├── android/                    # Android native code
├── ios/                        # iOS native code
├── pubspec.yaml               # Dependencies
└── README.md
```

## 🔧 Development

### Code Quality

```bash
# Analyze code
flutter analyze

# Format code
flutter format .

# Run linter
dart fix --dry-run
dart fix --apply
```

### Testing

```bash
# Run unit tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test

# Run specific test
flutter test test/features/auth/auth_test.dart
```

### Build

```bash
# Build APK (Android)
flutter build apk --release

# Build App Bundle (Android)
flutter build appbundle --release

# Build IPA (iOS)
flutter build ios --release

# Build for specific flavor
flutter build apk --flavor production --release
```

## 📦 Dependencies

### Core Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.9
  # or flutter_bloc: ^8.1.3
  
  # Navigation
  go_router: ^13.0.0
  
  # Network
  dio: ^5.4.0
  retrofit: ^4.0.3
  
  # Real-time
  socket_io_client: ^2.0.3
  
  # Local Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.2
  
  # UI
  cached_network_image: ^3.3.1
  shimmer: ^3.0.0
  flutter_svg: ^2.0.9
  
  # Maps & Location
  google_maps_flutter: ^2.5.3
  geolocator: ^11.0.0
  
  # Camera & Media
  camera: ^0.10.5
  image_picker: ^1.0.7
  
  # Payment
  flutter_stripe: ^10.1.1
  
  # Firebase
  firebase_core: ^2.24.2
  firebase_messaging: ^14.7.9
  firebase_analytics: ^10.8.0
  
  # AR
  arcore_flutter_plugin: ^0.1.0
  arkit_plugin: ^1.0.7
  
  # Utils
  intl: ^0.18.1
  url_launcher: ^6.2.3
  share_plus: ^7.2.1
```

## 📱 App Features

### Authentication
- Email/Phone login & registration
- OAuth (Google, Apple, Facebook)
- Biometric authentication (Face ID, Fingerprint)
- OTP verification
- Password recovery

### Product Discovery
- Advanced search with filters
- AI-powered recommendations
- Category browsing
- AR Try-On
- 360° product view
- Live shopping sessions

### Shopping Experience
- Multi-vendor cart
- Wishlist with price alerts
- Multiple payment methods
- Gift options
- Delivery scheduling
- Promo codes & vouchers

### Order Management
- Real-time order tracking
- Live map tracking
- Order history
- Easy returns & refunds
- Order notifications

### Communication
- In-app chat with sellers
- Push notifications
- Email notifications
- SMS notifications

### Seller Dashboard
- Sales analytics
- Product management
- Inventory tracking
- Order processing
- Live shopping studio
- Customer chat
- Earnings & payouts

## 🎨 Design System

### Colors
```dart
class AppColors {
  static const primary = Color(0xFF1A1F3A);      // Deep Navy
  static const secondary = Color(0xFFE8B4A0);    // Rose Gold
  static const accent = Color(0xFF2D5F5D);       // Emerald Green
  static const background = Color(0xFFFAF8F5);   // Soft Cream
  static const textPrimary = Color(0xFF2C2C2C);  // Charcoal
  static const success = Color(0xFF7FA99B);      // Sage Green
  static const error = Color(0xFF8B2635);        // Burgundy
}
```

### Typography
```dart
class AppTypography {
  static const headingFont = 'PlayfairDisplay';
  static const bodyFont = 'Inter';
  static const accentFont = 'CormorantGaramond';
}
```

## 🔐 Security

- Secure storage for tokens (flutter_secure_storage)
- SSL pinning
- Biometric authentication
- Encrypted sensitive data
- OWASP Mobile Top 10 compliance
- Certificate pinning

## 📊 Performance

- Lazy loading & pagination
- Image caching & optimization
- Code splitting
- Build optimization
- Memory management
- Network caching

## 🚀 Deployment

### Android (Google Play Store)

```bash
# Build release bundle
flutter build appbundle --release

# Sign the app (configure in android/app/build.gradle)
# Upload to Play Console
```

### iOS (App Store)

```bash
# Build release IPA
flutter build ios --release

# Archive in Xcode
# Upload to App Store Connect
```

### CI/CD with GitHub Actions

```yaml
# .github/workflows/flutter.yml
name: Flutter CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test
      - run: flutter build apk
```

## 📝 Environment Variables

```env
# .env
API_BASE_URL=https://api.luxemart.com
SOCKET_URL=wss://api.luxemart.com
STRIPE_PUBLISHABLE_KEY=pk_test_xxx
GOOGLE_MAPS_API_KEY=xxx
AGORA_APP_ID=xxx
FIREBASE_PROJECT_ID=xxx
```

## 🌍 Localization

```bash
# Generate localization files
flutter gen-l10n

# Supported languages
- English (en)
- Indonesian (id)
- Add more in lib/l10n/
```

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

MIT License

## 👥 Team

- Mobile Lead: [Your Name]
- Flutter Developer: [Name]
- UI/UX Designer: [Name]
- QA Engineer: [Name]

## 📞 Support

- Email: support@luxemart.com
- Documentation: https://docs.luxemart.com
- Flutter Docs: https://docs.flutter.dev

---

**Built with ❤️ using Flutter by LuxeMart Team**
