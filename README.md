# 📚 MavBooks

Scan books with your camera, track your reading, sync across devices. A self-hostable Goodreads/Bookly-style web app — single HTML file, no build step.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Made with vanilla JS](https://img.shields.io/badge/made%20with-vanilla%20JS-f7df1e)](#)
[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fyour-username%2Fmavbooks&project-name=mavbooks&repository-name=mavbooks)

---

## ✨ Features

- 📷 **Barcode scanner** — point your phone at the ISBN on the back cover, auto-fetches title, cover, author, and page count from [Open Library](https://openlibrary.org)
- 🔎 **Title search** — find anything by title, author, or ISBN
- ✏️ **Manual entry** — fallback for rare or unindexed books
- 🗂️ **3 shelves** — To Read · Reading · Read (auto-stamps start/finish dates)
- ⭐ **Star ratings + notes** — 1–5 stars and personal notes per book
- 📈 **Page tracker** — current page out of total, with progress bar
- 📊 **Stats dashboard** — books finished, pages read, avg rating, recent activity
- ☁️ **Optional cloud sync** — bring-your-own Firebase, syncs across devices via Google sign-in
- 💾 **Export / import** — JSON backup + restore
- 🌑 **Dark UI**, mobile-first, works offline once loaded

## 🚀 Deploy in 60 seconds

### Option 1 — Vercel (recommended)

Click the button, sign in with GitHub, and Vercel will fork the repo and deploy:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fyour-username%2Fmavbooks&project-name=mavbooks&repository-name=mavbooks)

Or via CLI:

```bash
npm i -g vercel
vercel deploy --prod
```

That's it — you'll get an HTTPS URL like `https://mavbooks.vercel.app` and the camera scanner will work immediately.

### Option 2 — Push to GitHub, then connect to Vercel

**Windows:** double-click `setup-git.bat` — it initializes the repo and makes your first commit. Then create an empty repo at [github.com/new](https://github.com/new) and run:

```bash
git remote add origin https://github.com/YOUR-USERNAME/mavbooks.git
git push -u origin main
```

**macOS / Linux / WSL:**

```bash
git init -b main
git add .
git commit -m "Initial commit"
gh repo create mavbooks --public --source=. --push
```

Then import the repo at [vercel.com/new](https://vercel.com/new). Every push to `main` auto-deploys.

### Option 3 — GitHub Pages

Push to GitHub, then in **Settings → Pages**, set source to `main` branch / root. You'll get `https://your-username.github.io/mavbooks/`.

### Option 4 — Drag-and-drop

Just drop the folder onto [app.netlify.com/drop](https://app.netlify.com/drop) — instant HTTPS URL, no account needed.

## 🛠 Local development

The browser blocks camera access on `file://` URLs, so use a real server.

**Windows:** double-click `launch.bat`

**macOS / Linux:** `./launch.sh` (run `chmod +x launch.sh` first)

**Anywhere with Node:** `npm run dev`

**Anywhere with Python:** `python3 -m http.server 8080`

Then open `http://localhost:8080`.

## ☁️ Cloud sync setup (optional, ~5 min)

Without setup, your library lives in `localStorage` on whichever browser you used to add books. To sync across phone + laptop, hook up a free Firebase project — the app has a built-in setup guide:

1. Open the deployed app
2. Tap the ⚙️ gear icon → **Set up Firebase**
3. Follow the 6 numbered steps (create project → enable Google auth → enable Firestore → paste config)
4. Sign in with Google. Done.

Firebase's free tier (Spark plan) covers ~50K reads/day — way more than this app will ever use.

> **Privacy note:** your Firebase config goes in your browser's `localStorage`, not the deployed code. Anyone visiting your public URL gets an empty app and is prompted to bring their own Firebase project. Your books stay in your Firestore.

## 📁 Project structure

```
mavbooks/
├── index.html        # The entire app (HTML + CSS + JS, single file)
├── vercel.json       # Vercel config (caching + security headers)
├── package.json      # Scripts: npm run dev
├── launch.bat        # Windows one-click local launcher
├── launch.sh         # macOS/Linux one-click local launcher
├── setup-git.bat     # Windows one-click git init + first commit
├── .gitignore
├── LICENSE           # MIT
└── README.md
```

No build step. No bundler. No node_modules required to run. Open the HTML file, you have an app.

## 🧰 Tech stack

| What | Why |
|---|---|
| **Vanilla JS + HTML + CSS** | Zero build, zero dependencies to install, deploys anywhere static |
| **[@zxing/browser](https://github.com/zxing-js/browser)** (CDN) | Mature barcode scanner, ESM module, no install |
| **[Open Library API](https://openlibrary.org/developers/api)** | Free, no API key, millions of books with covers |
| **Firebase Firestore + Auth** (CDN, optional) | Free cross-device sync, lazy-loaded only if user configures it |
| **localStorage** | Default storage, works offline |

## 📝 Customization tips

- **Branding:** the logo and color tokens live at the top of `<style>` in `index.html` (`--accent`, `--bg`, etc.)
- **Add a feature:** the JS is organized into clear sections (`STORAGE`, `BOOK API`, `RENDER`, `SCANNER`, `EVENTS`) — search for the `// ==========` comments
- **Different book API:** swap `lookupByISBN` and `searchBooks` to point at Google Books, ISBNdb, etc.

## 🤝 Contributing

This is a personal project, but PRs welcome. Some ideas if you're looking for somewhere to start:

- Yearly reading goal tracker (e.g. "12 books in 2026")
- CSV export in Goodreads format
- Reading streaks / daily progress charts
- Genre tags + multi-shelf filters
- Book recommendation engine
- Dark/light theme toggle

## 📄 License

MIT © 2026 Michael Muirhead. See [LICENSE](./LICENSE).

Book metadata and covers from [Open Library](https://openlibrary.org), used under their open data terms.
