<div align="center">

# 📱 Velvoria Mobile

### Premium Luxury Marketplace - Flutter Application

[![Flutter](https://img.shields.io/badge/Flutter-3.16+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![iOS](https://img.shields.io/badge/iOS-13+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/ios/)
[![Android](https://img.shields.io/badge/Android-8+-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://www.android.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

**Native performance. Luxury experience. One codebase.**

[Features](#-features) • [Screenshots](#-screenshots) • [Quick Start](#-quick-start) • [Architecture](#-architecture)

</div>

---

## 🎯 Overview

Velvoria Mobile is a **premium cross-platform mobile application** built with Flutter, delivering native performance and stunning UI for luxury e-commerce. Experience seamless shopping with AR try-on, live shopping, and real-time features.

### Why Flutter?

- 🚀 **Native Performance** - 60fps smooth animations
- 💎 **Beautiful UI** - Material Design 3 with custom luxury theme
- 📱 **Single Codebase** - iOS & Android from one source
- ⚡ **Hot Reload** - Instant development feedback
- 🎨 **Customizable** - Fully branded experience

---

## ✨ Features

### 🛍️ Shopping Experience
- **Advanced Search** - AI-powered product discovery
- **AR Try-On** - Virtual product visualization
- **360° View** - Interactive product preview
- **Live Shopping** - Real-time streaming with hosts
- **Smart Filters** - Intuitive product filtering
- **Wishlist** - Save favorites with price alerts

### 🔐 Authentication
- **Multi-Method Login** - Email, Phone, Social OAuth
- **Biometric Auth** - Face ID & Fingerprint
- **OTP Verification** - Secure phone verification
- **Social Login** - Google, Apple, Facebook

### 💳 Payment & Checkout
- **Multiple Gateways** - Stripe, Midtrans, PayPal
- **Installment Plans** - Flexible payment options
- **Digital Wallets** - GoPay, OVO, Dana
- **COD Support** - Cash on delivery
- **Secure Processing** - PCI-DSS compliant

### 📦 Order Management
- **Real-time Tracking** - Live order status
- **Map Integration** - Track delivery on map
- **Push Notifications** - Order updates
- **Easy Returns** - Hassle-free refunds
- **Order History** - Complete purchase records

### 💬 Communication
- **In-App Chat** - Direct seller messaging
- **Push Notifications** - Real-time alerts
- **Email Notifications** - Order confirmations
- **Customer Support** - 24/7 help center

### 👨‍💼 Seller Dashboard
- **Sales Analytics** - Revenue insights
- **Product Management** - Easy inventory control
- **Order Processing** - Streamlined fulfillment
- **Live Shopping Studio** - Host live sessions
- **Customer Chat** - Direct communication
- **Payout Management** - Track earnings

---

## 🏗️ Architecture

### Clean Architecture Pattern

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (UI, Widgets, State Management)        │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│          Domain Layer                   │
│  (Business Logic, Use Cases, Entities)  │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│           Data Layer                    │
│  (Repositories, Data Sources, Models)   │
└─────────────────────────────────────────┘
```

### State Management

- **Riverpod** - Reactive state management
- **Provider Pattern** - Dependency injection
- **Immutable State** - Predictable updates

### Tech Stack

| Category | Technology |
|----------|-----------|
| **Framework** | Flutter 3.16+ |
| **Language** | Dart 3.2+ |
| **State Management** | Riverpod / Bloc |
| **Navigation** | Go Router |
| **Network** | Dio + Retrofit |
| **Local Storage** | Hive + Shared Preferences |
| **Real-time** | Socket.io Client |
| **Maps** | Google Maps Flutter |
| **Payment** | Stripe Flutter SDK |
| **Push Notifications** | Firebase Cloud Messaging |
| **Analytics** | Firebase Analytics |
| **Crash Reporting** | Firebase Crashlytics |
| **AR** | ARCore / ARKit |

---

## 🚀 Quick Start

### Prerequisites

```bash
Flutter SDK >= 3.16.0
Dart SDK >= 3.2.0
Android Studio / Xcode
```

### Installation

```bash
# Clone repository
git clone https://github.com/Naufall18/Velvoria-mobile.git
cd Velvoria-mobile

# Install dependencies
flutter pub get

# Setup environment
cp .env.example .env
# Edit .env with your API keys

# Check Flutter setup
flutter doctor

# Run on device
flutter run
```

### Platform-Specific Setup

#### iOS Setup
```bash
cd ios
pod install
cd ..
flutter run -d ios
```

#### Android Setup
```bash
flutter run -d android
```

---

## 📁 Project Structure

```
Velvoria-mobile/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── app.dart                     # App configuration
│   ├── core/
│   │   ├── constants/              # App constants
│   │   ├── theme/                  # App theme & styles
│   │   ├── utils/                  # Helper functions
│   │   ├── routes/                 # Navigation routes
│   │   └── config/                 # App configuration
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/              # Data sources & repos
│   │   │   ├── domain/            # Entities & use cases
│   │   │   └── presentation/      # UI & state
│   │   ├── home/
│   │   ├── product/
│   │   ├── cart/
│   │   ├── order/
│   │   ├── profile/
│   │   ├── vendor/
│   │   ├── chat/
│   │   └── live_shopping/
│   ├── shared/
│   │   ├── widgets/               # Reusable widgets
│   │   ├── models/                # Shared models
│   │   └── services/              # Shared services
│   └── l10n/                      # Localization
├── assets/
│   ├── images/                    # Image assets
│   ├── icons/                     # Icon assets
│   └── fonts/                     # Custom fonts
├── test/                          # Unit tests
├── integration_test/              # Integration tests
├── android/                       # Android native
├── ios/                           # iOS native
├── pubspec.yaml                   # Dependencies
└── README.md                      # This file
```

---

## 🔧 Development

### Running the App

```bash
# Development mode
flutter run

# Release mode
flutter run --release

# Specific device
flutter devices
flutter run -d <device-id>

# With flavor
flutter run --flavor development
flutter run --flavor production
```

### Code Quality

```bash
# Analyze code
flutter analyze

# Format code
dart format .

# Fix issues
dart fix --apply

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing

```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test

# Coverage
flutter test --coverage

# Specific test
flutter test test/features/auth/auth_test.dart
```

### Building

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# With flavor
flutter build apk --flavor production --release
```

---

## 🎨 Design System

### Color Palette

```dart
class AppColors {
  // Primary Colors
  static const primary = Color(0xFF1A1F3A);      // Deep Navy
  static const secondary = Color(0xFFE8B4A0);    // Rose Gold
  static const accent = Color(0xFF2D5F5D);       // Emerald Green
  
  // Background
  static const background = Color(0xFFFAF8F5);   // Soft Cream
  static const surface = Color(0xFFFFFFFF);      // White
  
  // Text
  static const textPrimary = Color(0xFF2C2C2C);  // Charcoal
  static const textSecondary = Color(0xFF757575); // Gray
  
  // Status
  static const success = Color(0xFF7FA99B);      // Sage Green
  static const error = Color(0xFF8B2635);        // Burgundy
  static const warning = Color(0xFFF59E0B);      // Amber
  static const info = Color(0xFF3B82F6);         // Blue
}
```

### Typography

```dart
class AppTypography {
  static const String headingFont = 'PlayfairDisplay';
  static const String bodyFont = 'Inter';
  static const String accentFont = 'CormorantGaramond';
  
  static TextStyle h1 = TextStyle(
    fontFamily: headingFont,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle body = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
```

---

## 🔐 Security

- ✅ Secure storage for tokens
- ✅ SSL pinning
- ✅ Biometric authentication
- ✅ Encrypted sensitive data
- ✅ OWASP Mobile Top 10 compliance
- ✅ Certificate pinning
- ✅ Code obfuscation

---

## 📊 Performance

- ⚡ Lazy loading & pagination
- ⚡ Image caching & optimization
- ⚡ Code splitting
- ⚡ Build optimization
- ⚡ Memory management
- ⚡ Network caching
- ⚡ Widget optimization

---

## 🚀 Deployment

### Android (Google Play)

```bash
# Build release bundle
flutter build appbundle --release

# Sign the app (keystore configured)
# Upload to Play Console
```

### iOS (App Store)

```bash
# Build release
flutter build ios --release

# Archive in Xcode
# Upload to App Store Connect
```

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file.

---

## 👥 Team

- **Mobile Lead**: [Your Name]
- **Flutter Developer**: [Name]
- **UI/UX Designer**: [Name]

---

## 📞 Support

- 📧 Email: support@Velvoria.com
- 📚 Docs: https://docs.Velvoria.com
- 🐛 Issues: [GitHub Issues](https://github.com/Naufall18/Velvoria-mobile/issues)

---

<div align="center">

**Built with ❤️ using Flutter**

⭐ Star us on GitHub!

</div>
