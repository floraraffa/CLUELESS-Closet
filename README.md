![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)
![Platform](https://img.shields.io/badge/Platform-Snap_Spectacles-black.svg)
![Tech](https://img.shields.io/badge/Powered_by-Lens_Studio_5.15-yellow.svg)
![Cloud](https://img.shields.io/badge/Cloud-Snap_Cloud_·_Supabase-3ECF8E.svg)
![Web](https://img.shields.io/badge/Web-React_+_Vite-61DAFB.svg)

<h1 align="center">Closet Club 👕✨</h1>

<p align="center">
  <em>
    Turn your bedroom mirror into an augmented reality wardrobe.
    Scan real clothes with Spectacles, generate collectible style polaroids,
    and build a persistent digital closet inspired by the iconic movie <strong>Clueless</strong> —
    now with a living web catalog that never forgets a garment.
  </em>
</p>

<p align="center">
  Open Source • MIT License • Built with Lens Studio 5.15
</p>

<p align="center">
  <strong>🌐 Live web catalog → <a href="https://closetclub.netlify.app">closetclub.netlify.app</a></strong>
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
- ☁️ Sync every card to a personal web catalog, automatically
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

# ✨ What's New — The Cloud Update

The lens now talks to the outside world. Every closet lives in two places at once:

> **The lens is ephemeral. The web is forever.**

Spectacles storage is limited, so the glasses behave like a fitting room while the web
becomes the permanent archive. Delete a card in the lens to free space — your web catalog
keeps it. Delete on the web, and it is gone for real, everywhere.

### ☁️ Automatic Cloud Sync — *Snap Cloud (Supabase)*

Every saved garment uploads itself with its category, AI metadata, and the **AI-generated
cutout image** (never the raw scan photo). No buttons, no accounts, no friction.

### 🌐 A Living Web Catalog — [closetclub.netlify.app](https://closetclub.netlify.app)

A public gallery greets visitors with each user's **Bitmoji** and their closet.
Inside: every garment filtered by category, season, occasion and rarity — plus all saved
outfits with their AI match score and stylist notes. Localized in **FR · EN · ES**.

### 🔑 Owner Codes — No Email, No Passwords

The lens shows a personal code (`CLUB-XXXX-XXXX`) in your AR profile. Enter it once on the
web and you become the owner: delete garments, manage outfits, control your closet.

### 🌍/🔒 Public or Private Closets

One tap on the visibility chip makes your closet public (in the gallery, viewable by
anyone) or private (only you, with your code). Your own closet always stays reachable.

### ❤️ Favorites, Everywhere

Mark favorites on the cards in AR or with the heart on the web — they sync both ways.

### 🕶️ Send Back to Lens

Deleted a garment from your Spectacles but regret it? One click on the web queues it, and
the lens rebuilds the full collectible card — artwork included — on the next session.

### 🗂️ MY CLOSET — The Palm Panel

The open-palm gesture now deploys an organized panel instead of a card cloud:
a flat, steady grid (4 per row, paginated), a category bar
(✨ All · Tops · Jackets · Bottoms · Shoes · Accessories · Dresses · Favorites ♥),
prev/next paging that only appears when needed, and a "Showing:" label.
The selected filter is highlighted in bordeaux — very Cher Horowitz.

### 💯 Honest Match Scores

The AI stylist now decides the outfit match percentage itself and it is stored with each
outfit on the web, together with the stylist's written verdict.

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

Your collection lives around your wrist and expands into the MY CLOSET palm panel —
filtered, paginated, and organized by category.

### 6. Your closet appears on the web ☁️

Every card syncs itself to your personal catalog at
[closetclub.netlify.app](https://closetclub.netlify.app), with your Bitmoji on the door.

### 7. Progress and personalize 🎮

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

Browse your wardrobe using intuitive gestures. A palm-out gesture deploys the MY CLOSET
panel: category filters, favorites, pagination — all floating in front of you.

### 🧥 AI Outfit Recommendations

Mix and match clothing pieces, receive stylist feedback with a real match score,
or let the AI build the perfect look for you.

### ☁️ Persistent Cloud Wardrobe

Snap Cloud (Supabase) keeps the permanent catalog: garments, outfits, favorites,
match scores and stylist notes — safe even when the lens frees up space.

### 🎮 Gamified Progression

Earn XP, level up, prestige your account, and maintain daily streaks as your digital wardrobe grows.

### 🔊 Style Narration & TTS

AI-generated stylist commentary includes text-to-speech narration and animated subtitles.

### 🎵 In-Lens Music Player

Enjoy built-in playlists with play, pause, previous, and next controls.

### 🌍 Multi-Language Support

Full localization in English 🇬🇧, French 🇫🇷 and Spanish 🇪🇸 — in the lens **and** on the web.

### 🎓 Guided Onboarding

A first-launch tutorial in the lens, plus an illustrated 8-step "About Closet Club"
guide on the web — including how to find your owner code in your AR profile.

---

# Repository Structure

```
├── Assets/            Lens Studio project (scripts, scenes, art)
├── Packages/          Lens Studio packages
├── Closet FINAl DGNS.esproj
└── web/               Web catalog (React + Vite)
    ├── src/           App, i18n (FR/EN/ES), styles
    └── supabase/      SQL modules for Snap Cloud (run in order)
```

---

# Scripts

| Script | Description |
|---|---|
| **ClosetClubScanner.ts** | Main application controller connecting all systems together. |
| **ClothingScanner.ts** | Captures images and sends them to OpenAI Vision for garment identification. |
| **ClosetCardUI.ts** | Displays item metadata, rarity, and loading states. |
| **StyleNarrator.ts** | Generates stylist commentary with TTS, subtitles, and the outfit match score. |
| **ClosetTypes.ts** | Shared data structures used throughout the project. |
| **CollectionManager.ts** | Saved items, carousel, MY CLOSET panel buttons, favorites, cloud restore. |
| **CardInteraction.ts** | Card grabbing and gestures, plus the palm-deployed grid panel layout. |
| **CloudManager.ts** | Snap Cloud (Supabase) sync: items, outfits, favorites, images, pairing codes. |
| **XPManager.ts** | Levels, prestige, daily streaks, and your web access code in the AR profile. |
| **WelcomeManager.ts** | Displays the welcome screen and language selection flow. |
| **OnboardingManager.ts** | Controls the guided first-time user experience. |
| **BrandLogoLoader.ts** | Downloads and displays fashion brand logos dynamically. |
| **MusicPlayer.ts** | Manages the integrated music player system. |
| **Localization.ts** | Handles EN/FR/ES translations across the entire application. |
| **AnalyticsManager.ts** | *(Optional)* Local metrics, debugging, and lightweight session tracking. |

---

# Requirements

- Lens Studio **5.15** (recommended)
- Snap Spectacles device
- Internet connectivity for AI features
- OpenAI API integration
- A **Snap Cloud** (Supabase) project for the cloud wardrobe & web catalog

The following systems require network access:

- Clothing recognition
- Style narration
- AI-generated polaroids
- Outfit recommendations
- Cloud sync & web catalog

---

# Installation

### Lens

Clone the repository:

```bash
git clone https://github.com/floraraffa/CLUELESS-Closet.git
```

Open the project in Lens Studio:

```bash
Closet FINAl DGNS.esproj
```

Deploy to your Spectacles device and start building your virtual wardrobe.

### Web catalog

```bash
cd web
npm install
npm run dev        # runs in demo mode without any configuration
```

To connect your own Snap Cloud project:

1. In the Snap Cloud portal, open your project's SQL Editor.
2. Run the modules in [`web/supabase/`](web/supabase) in this order:
   `schema.sql` → `web-access.sql` → `multi-user.sql` → `public-landing.sql` →
   `web-manda.sql` → `outfits-fecha.sql` → `restore-queue.sql` → `visibility.sql` → `fix-token-case.sql`
3. Copy `.env.example` to `.env` and fill in your project URL and anon key.
4. In Lens Studio, point the `SupabaseProject` asset to the same project.
5. Deploy: `npm run build` and upload `dist/` to Netlify (or any static host).

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
- Cloud-connected AR ↔ web experiences
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
