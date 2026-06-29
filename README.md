![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)
![Platform](https://img.shields.io/badge/Platform-Snap_Spectacles-black.svg)
![Tech](https://img.shields.io/badge/Powered_by-Lens_Studio_5.15-yellow.svg)
<h1 align="center">Closet Club</h1>
<p align="center">
  <em>
    An open-source AR wardrobe scanner Lens for Snap Spectacles, allowing users to scan real clothing,
    generate collectible style cards, level up, and sync their closet in the cloud.
  </em>
</p>
<p align="center">
  <!-- Replace the src below with your Closet Club banner / demo GIF -->
  <img width="800" height="450" alt="Closet Club preview" src="https://github.com/user-attachments/assets/REPLACE_WITH_YOUR_IMAGE" />
</p>

---

## Overview

**Closet Club** is an open-source Lens project designed for **Snap Spectacles**.  
It provides a complete gameplay loop to scan clothing in the real world, generate collectible style cards, and build a persistent AR closet.

The project is intended as:
- a **technical reference**
- a **creative playground**
- and a **starting point** for custom Spectacles collectible/gameified experiences

Users are responsible for respectful and lawful use of scanned content and cloud features.

---

## Features

- **AI Clothing Scanning**  
  Capture and identify real garments and outfits, then generate a rich style card.

- **Collectible Closet System**  
  Save scanned items, manage rarity, browse your wardrobe in a carousel and grid, and visualize cards in AR.

- **AI Collector Cards**  
  Generate stylized collector card artwork for your saved pieces (gpt-image-1).

- **XP / Progression**  
  Earn XP, level up, prestige, and track daily streak and trust/reputation metrics.

- **Cloud Sync (Supabase + Snap Cloud)**  
  Sync profiles, collection data, leaderboard stats, and card images.

- **Style Narration + UI Feedback**  
  Includes a GPT stylist note, text-to-speech narration, scrolling subtitles, and immersive status feedback.

- **Guided Onboarding**  
  A first-launch tutorial walks new users through scanning, saving, and browsing their closet.

- **Multi-Language (EN / FR / ES)**  
  Full localization with language selection on launch.

---

## Scripts

| Script | What it does |
|---|---|
| **ClosetClubScanner.ts** | The brain of the app, connects all the other scripts together so they work as one. |
| **ClothingScanner.ts** | Takes a photo with the Spectacles camera and asks AI (OpenAI Vision) to identify the clothing in it. |
| **ClosetCardUI.ts** | Displays the item info card on screen (name, stats, rarity) and manages its loading/error states. |
| **StyleNarrator.ts** | Reads out a fun stylist note about the scanned item using text-to-speech and scrolling subtitles. |
| **ClosetTypes.ts** | Defines the shared data structures (what an "item" looks like in code) used by all other scripts. |
| **CollectionManager.ts** | Saves your scanned items, manages the rotating card carousel, and generates AI collector card images. |
| **CardInteraction.ts** | Lets you grab, move, and swipe through your collection cards using your hands. |
| **XPManager.ts** | Tracks your XP, level, daily streak, prestige, and trust, and shows the animated +XP popup when you earn points. |
| **CloudManager.ts** | Syncs your closet, profile, and leaderboard score to the cloud (Supabase + Snap Cloud). |
| **WelcomeManager.ts** | Shows the welcome screen at launch and lets you pick your language (FR/EN/ES) before starting. |
| **OnboardingManager.ts** | Plays the first-launch guided tutorial (scan → save → open closet → carousel → grid → outfit). |
| **BrandLogoLoader.ts** | Downloads and displays the correct brand logo on each item card. |
| **MusicPlayer.ts** | Plays the in-Lens music playlist with play/pause and previous/next track controls. |
| **LanguageVideoPlayer.ts** | Plays a remote intro video on the welcome screen and releases it when the screen closes. |
| **AnalyticsManager.ts** | Tracks session metrics, timing, and error logs locally without blocking the main flow. |
| **Localization.ts** | Manages all the text translations so the app can display content in English, French, or Spanish. |

---

## Requirements

- **Lens Studio** (5.15 recommended)
- **Snap Spectacles** device for deployment/testing
- Internet access for cloud and AI features
- Valid Snap Cloud / Supabase configuration for online features

---

## Installation

```bash
git clone https://github.com/floraraffa/CLUELESS-Closet.git
```

Open the project file in Lens Studio:

```bash
Closet FINAl DGNS.esproj
```

<p align="center">
  Developed with ❤️ by GuillaumeDGNS
</p>
