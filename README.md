<div align="center">

# 🌾 AgriBen

### L'application agricole premium du Bénin

**Gérez vos cultures, vendez vos produits, recevez des conseils et améliorez votre rendement.**

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-3DDC84?style=for-the-badge)

<br>

[![AgriBen Banner](https://img.shields.io/badge/Version-1.0.0-22C55E?style=for-the-badge)]()

</div>

---

## 📱 À propos

AgriBen est une application mobile conçue pour les **agriculteurs du Bénin**. Elle offre des outils modernes pour gérer les cultures, diagnostiquer les maladies des plantes, vendre directement les produits agricoles et recevoir des conseils personnalisés.

> *L'intelligence est invisible. Elle est intégrée naturellement dans l'expérience.*

---

## ✨ Fonctionnalités

<table>
<tr>
<td width="50%">

### 🏠 Dashboard intelligent
- Vue d'ensemble de l'exploitation
- Météo locale avec conseils
- État des cultures en temps réel
- Actions rapides

</td>
<td width="50%">

### 🔬 Diagnostic plantes
- Scan par photo ou galerie
- Identification des maladies
- Niveau de risque
- Traitement recommandé

</td>
</tr>
<tr>
<td width="50%">

### 💬 Assistant agricole
- Chat conversationnel
- Conseils personnalisés
- Réponses contextuelles
- Disponible 24/7

</td>
<td width="50%">

### 🛒 Marketplace
- Produits proches de vous
- Prix du marché en direct
- Meilleurs producteurs
- Contact direct

</td>
</tr>
<tr>
<td width="50%">

### 🗺️ Carte agricole
- Marchés à proximité
- Producteurs et coopératives
- Fournisseurs d'intrants
- Navigation intégrée

</td>
<td width="50%">

### 👤 Profil complet
- Statistiques de production
- Historique des activités
- Paramètres personnalisables
- Brand Kit intégré

</td>
</tr>
</table>

---

## 🎨 Design System

| Élément | Valeur |
|---------|--------|
| **Vert Forêt** | `#14532D` |
| **Vert Nature** | `#22C55E` |
| **Beige Terre** | `#D6C3A5` |
| **Or Réussite** | `#F59E0B` |
| **Typographie** | Poppins |
| **Border Radius** | 14-20px |
| **Style** | Material 3 |

---

## 📂 Architecture

```
lib/
├── app.dart                    # Point d'entrée MaterialApp
├── main.dart                   # Initialisation Flutter
├── theme/
│   ├── app_colors.dart         # Palette complète
│   ├── app_theme.dart          # Theme Material3
│   └── app_text_styles.dart    # Typography Poppins
├── models/
│   ├── crop.dart               # Modèle cultures
│   ├── product.dart            # Modèle marketplace
│   └── message.dart            # Modèle chat
├── logos/
│   ├── logo_leaf_field.dart    # Proposition 1
│   ├── logo_a_plant.dart       # Proposition 2
│   ├── logo_seed_growth.dart   # Proposition 3
│   ├── logo_abstract_agri.dart # Proposition 4 (recommandé)
│   ├── agriben_icon.dart       # Icône officielle
│   └── logo_showcase.dart      # Sélection des logos
├── widgets/
│   ├── weather_card.dart       # Carte météo
│   ├── quick_actions.dart      # Actions rapides
│   ├── crop_status_card.dart   # État cultures
│   ├── product_card.dart       # Carte produit
│   ├── market_price_card.dart  # Prix du marché
│   └── bottom_nav.dart         # Navigation basse
└── screens/
    ├── splash_screen.dart      # Écran de démarrage
    ├── onboarding_screen.dart  # 3 pages d'onboarding
    ├── home_screen.dart        # Dashboard principal
    ├── diagnostic_screen.dart  # Diagnostic plantes
    ├── assistant_screen.dart   # Chat assistant
    ├── marketplace_screen.dart # Marketplace
    ├── map_screen.dart         # Carte agricole
    ├── crops_screen.dart       # Liste cultures
    ├── messages_screen.dart    # Messages
    ├── profile_screen.dart     # Profil utilisateur
    └── brand_kit_screen.dart   # Identité visuelle
```

---

## 🚀 Démarrage rapide

### Prérequis
- [Flutter SDK](https://flutter.dev/docs/get-started/install) ≥ 3.x
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio / VS Code
- Device Android ou iOS

### Installation

```bash
# Cloner le repository
git clone https://github.com/grandelagbanou28-gif/AgriBen-AI.git

# Accéder au dossier
cd AgriBen-AI

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

### Build production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

---

## 📸 Écrans de l'application

| Splash | Onboarding | Dashboard |
|--------|-----------|-----------|
| Logo animé + chargement | 3 pages swipeables | Vue complète |

| Diagnostic | Assistant | Marketplace |
|-----------|-----------|-------------|
| Scan + résultats | Chat WhatsApp-like | Produits + prix |

---

## 🛠️ Technologies

- **Flutter** — Framework UI cross-platform
- **Dart** — Langage de programmation
- **Google Fonts** — Typographie Poppins
- **Material Design 3** — Système de design
- **CustomPainter** — Logos vectoriels haute qualité

---

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

<div align="center">

**Développé avec ❤️ pour les agriculteurs du Bénin**

[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/grandelagbanou28-gif)

</div>
