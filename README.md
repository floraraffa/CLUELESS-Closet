![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)
![Platform](https://img.shields.io/badge/Platform-Snap_Spectacles-black.svg)
![Tech](https://img.shields.io/badge/Powered_by-Lens_Studio_5.15-yellow.svg)

<h1 align="center">Closet Club 👕✨</h1>

<p align="center">
  <em>
    Turn your bedroom mirror into an augmented reality wardrobe.
    Scan real clothes with Spectacles, generate collectible style polaroids,
    and build a persistent digital closet inspired by the iconic movie <strong>Clueless</strong>.
  </em>
</p>

<p align="center">
  Open Source • MIT License • Built with Lens Studio 5.15
</p>

<p align="center">
  <img width="853" height="480" alt="Closet Club Demo" src="https://github.com/user-attachments/assets/921a52b2-c15d-41eb-a493-aa096eb91e52" />
</p>

---

# Overview

**Closet Club** is an open-source AR fashion experience built for **Snap Spectacles**.

The project was created by **Florencia Raffa** and **Guillaume DGNS**, inspired by the legendary digital wardrobe scene from *Clueless*.

The concept is simple:

> **Stand in front of your mirror and scan your wardrobe with Spectacles.**

Users can:

- 👕 Scan an entire outfit in a single pass
- 🧥 Identify multiple garments at once
- 👟 Capture individual pieces to build a collection item by item
- 🃏 Turn real-world clothing into collectible style polaroids
- 🎮 Progress through XP, levels, prestige systems, and daily streaks

Closet Club explores the intersection between:

- Artificial Intelligence
- Fashion Technology
- Wearable Computing
- Natural Hand Interactions
- Collectible Game Mechanics
- Persistent Augmented Reality Experiences

The project is intended as:

- 📚 A technical reference for Spectacles developers
- 🧪 A creative playground for AI-powered experiences
- 🎮 A foundation for collectible and progression systems
- 👗 An experiment in the future of digital fashion

Users remain responsible for respecting intellectual property and applicable laws when using AI-generated content and scanned materials.

---

# How It Works

### 1. Stand in front of your mirror 👕

Wear your Spectacles and point the camera toward your reflection.

### 2. Scan your outfit 📷

Capture your complete look in a single pass or focus on one specific garment.

### 3. AI identifies your clothes 🤖

OpenAI Vision analyzes garments and generates rich descriptions, metadata, and style information.

### 4. Generate collectible polaroids 🃏

Each item receives unique AI-generated artwork and a rarity level.

### 5. Build your AR closet ✋

Your collection lives around your wrist and can expand into a hand-controlled interactive grid.

### 6. Progress and personalize 🎮

Gain XP, maintain daily streaks, unlock prestige ranks, and receive AI stylist recommendations.

---

# Core Features

### 👕 Mirror-Based Clothing Scanning

Scan your full outfit in seconds or curate your wardrobe one piece at a time.

### 🤖 AI Fashion Recognition

OpenAI Vision identifies garments and generates detailed descriptions and metadata.

### 🃏 Collectible Style Polaroids

Every scanned item becomes a collectible with AI-generated visuals and rarity systems.

### ✋ Natural Hand Interactions

Browse your wardrobe using intuitive gestures.

A simple palm-out gesture expands your collection into an interactive AR grid.

### 🧥 AI Outfit Recommendations

Mix and match clothing pieces, receive stylist feedback, or let the AI build the perfect look for you.

### 🎮 Gamified Progression

Earn XP, level up, prestige your account, and maintain daily streaks as your digital wardrobe grows.

### 🔊 Style Narration & TTS

AI-generated stylist commentary includes text-to-speech narration and animated subtitles.

### 🎵 In-Lens Music Player

Enjoy built-in playlists with play, pause, previous, and next controls.

### 🌍 Multi-Language Support

Full localization in:

- English 🇬🇧
- French 🇫🇷
- Spanish 🇪🇸

### 🎓 Guided Onboarding

A first-launch tutorial teaches scanning, saving, browsing, outfit creation, and hand interactions.

---

# Scripts

| Script | Description |
|---|---|
| **ClosetClubScanner.ts** | Main application controller connecting all systems together. |
| **ClothingScanner.ts** | Captures images and sends them to OpenAI Vision for garment identification. |
| **ClosetCardUI.ts** | Displays item metadata, rarity, and loading states. |
| **StyleNarrator.ts** | Generates stylist commentary with TTS and animated subtitles. |
| **ClosetTypes.ts** | Shared data structures used throughout the project. |
| **CollectionManager.ts** | Manages saved items, carousel views, grids, and AI-generated artwork. |
| **CardInteraction.ts** | Handles grabbing, moving, and interacting with collectible polaroids. |
| **XPManager.ts** | Tracks levels, prestige, daily streaks, trust metrics, and XP animations. |
| **WelcomeManager.ts** | Displays the welcome screen and language selection flow. |
| **OnboardingManager.ts** | Controls the guided first-time user experience. |
| **BrandLogoLoader.ts** | Downloads and displays fashion brand logos dynamically. |
| **MusicPlayer.ts** | Manages the integrated music player system. |
| **Localization.ts** | Handles EN/FR/ES translations across the entire application. |
| **AnalyticsManager.ts** | *(Optional)* Local metrics, debugging, and lightweight session tracking. |
| **CloudManager.ts** | *(Optional)* Supabase cloud synchronization scaffolding. Disabled by default. |

---

# Requirements

- Lens Studio **5.15** (recommended)
- Snap Spectacles device
- Internet connectivity for AI features
- OpenAI API integration

The following systems require network access:

- Clothing recognition
- Style narration
- AI-generated polaroids
- Outfit recommendations

---

# Installation

Clone the repository:

```bash
git clone https://github.com/floraraffa/CLUELESS-Closet.git
```

Open the project in Lens Studio:

```bash
Closet FINAl DGNS.esproj
```

Deploy to your Spectacles device and start building your virtual wardrobe.

---

# Open Source Goals

Closet Club exists to explore what happens when:

- Everyday rituals become AR experiences
- Physical objects gain persistent digital identities
- AI assists creativity and self-expression
- Fashion becomes interactive and collectible
- Wearable devices evolve beyond traditional screens

We hope this project helps creators experiment with:

- AI-powered user experiences
- Collectible systems
- Hand-tracked interfaces
- Persistent virtual inventories
- Fashion and lifestyle applications for Spectacles

Feel free to fork, remix, and build entirely new concepts on top of this foundation.

We would love to see what the community creates next.

---

# License

This project is released under the **MIT License**.

You are free to:

- Use
- Modify
- Distribute

Please retain attribution to the original authors.

---

<p align="center">
Made with ❤️ by <strong>Florencia Raffa</strong> & <strong>Guillaume DGNS</strong>
<br><br>
Inspired by <em>Clueless (1995)</em> and the future of wearable computing.
