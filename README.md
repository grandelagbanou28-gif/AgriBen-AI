<div align="center">

# 🌾 AgriBen — Agricultural Intelligence Platform

### The future of farming in West Africa, built with Flutter

**11,000+ lines of production-ready code. 15+ screens. 6 reusable widgets. Zero AI branding — pure experience.**

![Flutter](https://img.shields.io/badge/Flutter-3.29-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.8-0175C2?style=flat-square&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-22C55E?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-3DDC84?style=flat-square)
![PRs](https://img.shields.io/badge/PRs-Welcome-brightgreen?style=flat-square)
![Stars](https://img.shields.io/github/stars/grandelagbanou28-gif/AgriBen-AI?style=flat-square&color=F59E0B)

<br/>

**[LIVE DEMO](https://github.com/grandelagbanou28-gif/AgriBen-AI)** · **[REPORT BUG](https://github.com/grandelagbanou28-gif/AgriBen-AI/issues)** · **[REQUEST FEATURE](https://github.com/grandelagbanou28-gif/AgriBen-AI/issues)**

</div>

---

<br/>

## Why AgriBen?

> **400 million farmers in Africa. 80% work on less than 2 hectares. Yet almost none have access to digital tools designed for their reality.**

AgriBen is not another generic agriculture app. It's a **premium mobile platform built specifically for Benin farmers** — designed to look and feel like a product from Google, Airbnb, or Revolut, but serving the agricultural heart of West Africa.

The intelligence is invisible. There are no AI badges, no robot icons, no tech jargon. Just a farmer, their crops, and a tool that works.

---

## Architecture & Features

<table>
<tr>
<td width="50%">

### 🏠 Smart Dashboard
Real-time farm overview with weather data, crop health status, yield estimates, and revenue tracking. One-tap actions for the most common tasks.

```dart
// 4 stat cards, weather API, crop status list
// All reactive with AnimatedContainer
```

</td>
<td width="50%">

### 🔬 Plant Diagnostic
Camera-based plant analysis with scan animation, risk assessment, and treatment recommendations. Results presented as agricultural advice — never as "AI output."

```dart
// Custom scan frame, progress animation
// Structured result cards with risk level
```

</td>
</tr>
<tr>
<td width="50%">

### 💬 Agricultural Assistant
WhatsApp-style conversational interface. Contextual replies about diseases, irrigation, soil, and market prices. Auto-reply engine with keyword matching.

```dart
// Message bubbles, timestamps
// 5+ topic triggers with detailed responses
```

</td>
<td width="50%">

### 🛒 Marketplace
Airbnb-inspired product grid with producer profiles, ratings, prices in FCFA, and direct contact. Horizontal scrolling price ticker with trend indicators.

```dart
// Product cards, price ticker
// Producer avatars, category filters
```

</td>
</tr>
<tr>
<td width="50%">

### 🗺️ Agricultural Map
Google Maps-style interface showing markets, producers, cooperatives, and suppliers. Filterable pins with distance and ratings.

```dart
// Custom map pins with emoji markers
// Bottom sheet with filtered results
```

</td>
<td width="50%">

### 🎨 Brand Kit & Logo System
4 vector logo proposals built with `CustomPainter`. Complete design system: colors, typography (Poppins), spacing, and border radius guidelines.

```dart
// 4 CustomPainter logo designs
// Official icon integrated in splash screen
```

</td>
</tr>
</table>

---

## Design Language

| Token | Value | Usage |
|-------|-------|-------|
| `forestGreen` | `#14532D` | Primary — trust, agriculture |
| `natureGreen` | `#22C55E` | Secondary — growth, vitality |
| `earthBeige` | `#D6C3A5` | Tertiary — soil, authenticity |
| `successGold` | `#F59E0B` | Accent — value, achievement |
| **Font** | Poppins 400-700 | All text |
| **Radius** | 14-20px | Cards, buttons |
| **Elevation** | 0-12px | Subtle shadows |
| **Design** | Material 3 | Full compliance |

---

## Project Structure

```
agribenia/
├── lib/
│   ├── main.dart                      # Entry point
│   ├── app.dart                       # MaterialApp config
│   ├── theme/
│   │   ├── app_colors.dart            # Color palette (16 colors)
│   │   ├── app_theme.dart             # Material3 theme
│   │   └── app_text_styles.dart       # Typography scale
│   ├── models/
│   │   ├── crop.dart                  # Crop model + 5 samples
│   │   ├── product.dart               # Product model + 6 samples
│   │   └── message.dart               # Chat model + auto-replies
│   ├── logos/
│   │   ├── logo_leaf_field.dart       # 🌿 Logo v1 — Leaf & Field
│   │   ├── logo_a_plant.dart          # 🌱 Logo v2 — Letter A + Plant
│   │   ├── logo_seed_growth.dart      # 🌾 Logo v3 — Seed → Growth
│   │   ├── logo_abstract_agri.dart    # ✨ Logo v4 — Abstract Premium
│   │   ├── agriben_icon.dart          # 📱 Official app icon
│   │   └── logo_showcase.dart         # 🎯 Logo selection screen
│   ├── widgets/                       # 6 reusable components
│   │   ├── weather_card.dart
│   │   ├── quick_actions.dart
│   │   ├── crop_status_card.dart
│   │   ├── product_card.dart
│   │   ├── market_price_card.dart
│   │   └── bottom_nav.dart
│   └── screens/                       # 11 screens
│       ├── splash_screen.dart         # Animated logo + loader
│       ├── onboarding_screen.dart     # 3-page onboarding
│       ├── home_screen.dart           # Dashboard
│       ├── diagnostic_screen.dart     # Plant scanner
│       ├── assistant_screen.dart      # Chat interface
│       ├── marketplace_screen.dart    # Product marketplace
│       ├── map_screen.dart            # Agricultural map
│       ├── crops_screen.dart          # Crop management
│       ├── messages_screen.dart       # Conversations list
│       ├── profile_screen.dart        # User profile
│       └── brand_kit_screen.dart      # Design system viewer
├── android/
├── ios/
├── web/
├── linux/
├── macos/
└── windows/
```

---

## Quick Start

```bash
# Clone
git clone https://github.com/grandelagbanou28-gif/AgriBen-AI.git
cd AgriBen-AI

# Install
flutter pub get

# Run (connected device)
flutter run

# Build APK
flutter build apk --release --split-per-abi

# Build iOS
flutter build ios --release
```

**Requirements:** Flutter ≥ 3.29, Dart ≥ 3.8, Android SDK 33+

---

## Screenshots

| Splash | Onboarding | Dashboard | Diagnostic |
|:---:|:---:|:---:|:---:|
| Logo animation + gradient | 3 swipeable pages | Weather + stats + crops | Camera scan + results |

| Assistant | Marketplace | Map | Profile |
|:---:|:---:|:---:|:---:|
| WhatsApp-style chat | Products + prices | Markets + producers | Stats + settings |

---

## Key Technical Decisions

| Decision | Rationale |
|----------|-----------|
| **CustomPainter for logos** | Vector-quality at any resolution, no external assets needed |
| **No AI branding** | Intelligence is invisible — farmers see advice, not algorithms |
| **Poppins typography** | Modern, readable, supports French + local languages |
| **Emoji in components** | Universally understood, no image assets required |
| **FCFA currency** | Native to Benin/CFA franc zone — builds trust |
| **Material 3** | Latest Flutter design system — future-proof |
| **Zero external API** | All data is mock — ready for backend integration |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.29 |
| Language | Dart 3.8 |
| Design | Material 3 |
| Typography | Google Fonts (Poppins) |
| State | StatefulWidget |
| Navigation | IndexedStack + PageRouteBuilder |
| Rendering | CustomPainter (logos) |
| Animation | AnimationController + CurvedAnimation |

---

## Contributing

Contributions are welcome! Please read the [CONTRIBUTING.md](CONTRIBUTING.md) guidelines.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for details.

---

## Author

**Grandel Agbanou** — Full-Stack Developer

[![GitHub](https://img.shields.io/badge/GitHub-grandelagbanou28-181717?style=flat-square&logo=github)](https://github.com/grandelagbanou28-gif)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat-square&logo=linkedin)](https://linkedin.com)

---

<div align="center">

### If this project helped you, give it a ⭐

**Built for the farmers of Benin. Built for Africa.**

</div>
