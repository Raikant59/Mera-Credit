# MeraCredit - Flutter WebView App

MeraCredit is a lightweight, production-grade Flutter application that loads a dynamic web URL (https://meracredit.in) using WebView. The URL is fetched from a REST API and includes features like error handling, no-internet fallback, retry support, and a modern splash screen.

---

## 📱 Features

- ✅ Dynamic WebView loading from REST API  
- ✅ Custom splash screen with logo & brand colors  
- ✅ Native splash disabled (only Flutter splash shown)  
- ✅ Fallback to default URL if API fails  
- ✅ No Internet detection with retry option  
- ✅ Debug logs for development  
- ✅ Controller reuse to avoid flicker  

---

## 📷 Screenshots

| Splash Screen | WebView |
|---------------|---------|
| ![Splash](screenshots/splash.png) | ![WebView](screenshots/webview.png) |

---

## 🛠️ Tech Stack

- Flutter (Stable)  
- Dart  
- WebView (`webview_flutter`)  
- Node.js for backend API (REST)  
- Connectivity check (`connectivity_plus`)  
- Custom fonts, color palette, splash design  

---

## 🧩 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  webview_flutter: ^4.4.2
  connectivity_plus: ^6.0.3
  http: ^1.2.1
```

# 🚀 Getting Started

## Prerequisites

- Flutter SDK (v3.19+)
- Android Studio / Xcode
- Node.js (for backend)
- Internet connection

---

## 🔧 Setup Instructions

### 1. Clone the repo

```bash
git clone https://github.com/your-username/meracredit-app.git
cd meracredit-app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 🌐 REST API Setup (Optional)

To fetch the URL dynamically:

### 📄 Node.js API Code (`index.js`)

```js
const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());

app.get('/link', (req, res) => {
  res.json({ url: "https://meracredit.in" });
});

app.listen(port, () => {
  console.log(`MeraCredit API running at http://localhost:${port}`);
});
```

### ▶️ Start the server:

```bash
node index.js
```

---

## 🔥 Customize

### ✅ Change Splash Background

Update in `lib/splash_screen.dart`:

```dart
Color.fromRGBO(7, 115, 103, 1) // RGBA(7,115,103,255)
```

---

### ✅ Add Custom Font

Add in `pubspec.yaml`:

```yaml
fonts:
  - family: Poppins
    fonts:
      - asset: assets/fonts/Poppins-Bold.ttf
```

Use in code:

```dart
Text('MeraCredit', style: TextStyle(fontFamily: 'Poppins'))
```

---

## 📱 App Icon

To change app icon:

1. Replace the icon in `assets/icon.png`
2. Run the following command:

```bash
flutter pub run flutter_launcher_icons:main
```

Add this to your `pubspec.yaml`:

```yaml
flutter_icons:
  android: true
  ios: true
  image_path: "assets/icon.png"
```

---

## 🧪 Test on Real Device

- Enable **USB Debugging**  
- Connect device and run:

```bash
flutter run --release
```

---

## 🏗️ Production Readiness

| Feature             | Status |
|---------------------|--------|
| Offline fallback    | ✅     |
| Retry on failure    | ✅     |
| Clean UI on error   | ✅     |
| WebView reuse       | ✅     |
| 10,000+ users safe  | ✅     |

---

## 📂 Folder Structure

```plaintext
lib/
├── main.dart
├── splash_screen.dart
├── webview_screen.dart
├── utils/
│   └── network_helper.dart
assets/
├── fonts/
├── icon.png
└── logo.png
```

---

## 📜 License

**MIT License** — feel free to use, modify, and distribute.

---

## 🤝 Contribution

Pull requests and suggestions are welcome!  
Open an issue first to discuss major changes.

---

## 👤 Author

Built with ❤️ by [Your Name](https://github.com/Raikant59)
