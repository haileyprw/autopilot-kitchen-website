# Autopilot Kitchen Website

Flutter Web marketing landing page for [Autopilot Kitchen](https://github.com/haileyprw/autopilot-kitchen-website).

**Plan once. Eat well for months.**

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Build for production

```bash
flutter build web --release --no-tree-shake-icons
```

Output is in `build/web/`.

## Deploy to Vercel (GitHub + GoDaddy)

This repo includes `vercel.json` and `scripts/vercel-build.sh` so Vercel can
install Flutter and build the site on each push.

### 1. Push to GitHub

Commit and push to the branch Vercel watches (usually `main`).

### 2. Vercel project settings

In the [Vercel dashboard](https://vercel.com) → your project → **Settings → General**:

- **Framework Preset:** Other
- **Root Directory:** `.` (repo root)
- Build/install/output are read from `vercel.json` — no overrides needed unless you set them manually (remove overrides if builds fail).

First deploy takes ~5–10 minutes while Flutter installs.

### 3. Domain (GoDaddy → Vercel)

If your domain is already connected in Vercel, you are set. In GoDaddy you should
either:

- Use Vercel nameservers, **or**
- CNAME `www` → `cname.vercel-dns.com` and apex redirect per Vercel’s DNS instructions

Confirm both `autopilotkitchen.com` and `www.autopilotkitchen.com` show the site in Vercel → **Domains**.

### 4. Firebase (required for waitlist on production)

In [Firebase Console](https://console.firebase.google.com/project/autopilot-kitchen/settings/general) → **Authorized domains**, add:

- `autopilotkitchen.com`
- `www.autopilotkitchen.com`
- Your `*.vercel.app` preview domain (optional, for preview deploys)

Firestore rules are already deployed. Test the waitlist form on the live domain after deploy.

### 5. After deploy

- Click through all footer links (Privacy, Terms, Contact)
- Submit a test email on the waitlist
- Check Firestore → `waitlist` collection in Firebase Console

## Project structure

```
lib/
├── core/
│   ├── constants/     # Breakpoints
│   ├── theme/           # App colors, typography, spacing (from main app)
│   └── widgets/         # AkButton, AkCard, AkTextField
└── features/landing/
    ├── presentation/    # Landing page + section widgets
    └── services/        # WaitlistService abstraction
```

## Waitlist (Firebase)

Signups are saved to Firestore:

- Collection: `waitlist` — document ID = normalized email
- Fields: `email`, `createdAt`
- Stats (admin only): `waitlistStats/summary` → `count` (updated on each new signup, not shown on site)

Deploy security rules before going live (rules cover both the website waitlist and main app user data):

```bash
firebase deploy --only firestore:rules
```

Rules live in `firestore.rules` — keep in sync with `~/Developer/autopilot_kitchen/firestore.rules`.

Restart the app after changing Firebase config (`flutter run -d chrome`).

## Design system

Uses the Autopilot Kitchen palette: sage, cream, terracotta, and DM Sans typography — matching the main Flutter app.

## Logo & favicon

The app logo lives at `assets/images/app_logo.png`. After updating it, regenerate web icons:

```bash
python3 tool/generate_favicon.py
```
