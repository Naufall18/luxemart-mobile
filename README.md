# 📱 Velvoria - Premium Flutter Mobile E-Commerce

<div align="center">
  <img src="https://images.unsplash.com/photo-1511999922693-8b96f0e0d6dc?auto=format&fit=crop&q=80&w=1000" alt="Velvoria Mobile Banner" width="100%" style="border-radius: 16px; margin-bottom: 20px;" />

  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](#)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](#)
  [![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](#)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge&logo=github)](#)
</div>

---

## ✨ Overview

**Velvoria Mobile** is the flagship Flutter-based mobile client for the Velvoria luxury marketplace. It delivers a native-like, smooth, and highly interactive shopping experience on both Android and iOS. Built with a focus on pixel-perfect UI, micro-interactions, and seamless integration with live shopping and AR try-on features.

---

## 🚀 Key Features

* **🎨 Pixel-Perfect UI/UX** - Fully custom theme system using Deep Navy, Rose Gold, and Emerald accents.
* **📦 Full Multi-Vendor Support** - Native buyer and seller apps with role-based UI.
* **🎥 Live Shopping Integration** - Real-time video streams with embedded product showcases.
* **👓 AR Try-On Ready** - Placeholder structure for ARCore/ARKit integration (glasses, watches, jewelry).
* **💳 Secure Payments** - Integrated with Midtrans, Stripe, and local wallet APIs (GoPay, OVO, Dana).
* **🔐 Biometric Auth** - Face ID & Fingerprint login support.
* **📲 Push Notifications** - Real-time order & promotional alerts via Firebase Cloud Messaging.

---

## 🛠️ Tech Stack

- **Framework:** Flutter 3.19+ (Dart 3.3+)
- **State Management:** Provider / Riverpod (scalable architecture)
- **Networking:** Dio (REST) + WebSocket (Live Chat)
- **Local Storage:** Hive & SharedPreferences
- **Firebase:** Auth, Cloud Messaging, Crashlytics
- **Icons & Animation:** Custom SVG assets + Lottie/Flottie

---

## 📥 Getting Started

### Prerequisites

- Flutter SDK (>= 3.19.0)
- Dart (>= 3.3.0)
- Android Studio / Xcode (for platform setup)
- Git

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Naufall18/velvoria-mobile.git
   cd velvoria-mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```
   *Ensures an emulator is running or a physical device is connected via USB debugging.*

4. **Build for Release**
   ```bash
   # Android
   flutter build apk --release
   # iOS
   flutter build ios --release
   ```

---

## 📐 Project Structure

```
velvoria-mobile/
├── android/                # Android native configuration
├── ios/                    # iOS native configuration
├── lib/
│   ├── core/               # Shared utilities, constants, theme
│   ├── data/               # Models, repositories, API services
│   ├── presentation/       # Screens, widgets, state providers
│   │   ├── buyer/          # Buyer-facing UI
│   │   └── seller/         # Seller dashboard UI
│   ├── main.dart           # App entry point
│   └── routes.dart         # Navigation setup
├── assets/                 # Images, icons, Lottie animations
├── pubspec.yaml            # Dependencies & assets declaration
└── test/                   # Unit/widget tests
```

---

<div align="center">
  <sub>Developed by <a href="https://github.com/Naufall18">Naufall18</a>. Built for luxury, speed, and scalability.</sub>
</div>