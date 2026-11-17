# Safeeq Ahamad S.S — Comic Portfolio

A comic-themed personal portfolio website for Safeeq Ahamad S.S (CSE Student · AI &amp; Web Developer).

## What's inside

- **`index.html`** — the complete single-file portfolio (comic themed)
- **`Safeeq_Ahamad_Resume.png`** — downloadable resume image
- **`certs/`** — 40 certificate files (38 Coursera/program PDFs + 2 internship PNGs)
- **`certificates.json` / `certificates_clean.json`** — structured certificate data

## Features

- Comic book theme (Bangers + Luckiest Guy + Comic Neue fonts, halftone paper background, thick black panel borders, layered text-shadows, "POW!" action burst)
- Spider-Man web SVG in all 4 corners that moves when you scroll
- 44 verified certifications with category filters + modal viewer
- 4 project case study modals (AETHERIA, HEALENIUM, Online-Shopping, AI Interview Assistant)
- 2 internship certificates (Tech Mahindra + Bharat Space Education Research Centre) viewable inline
- Separate comic-themed resume page (View Resume button)
- Fully responsive (PC + mobile with hamburger menu)
- All buttons functional — modals, filters, downloads, external links

## Deploy to GitHub Pages — 3 ways

### Option A — Replace your existing `portfolio` repo (recommended if you want it at `phantomsafeeq.github.io/portfolio/`)

```bash
# 1. Clone your existing portfolio repo
git clone https://github.com/Phantomsafeeq/portfolio.git
cd portfolio

# 2. Remove old files (keep .git folder!)
rm -rf *.html *.png certs/ certificates*.json 2>/dev/null

# 3. Copy all files from this folder into the cloned repo
# (copy index.html, Safeeq_Ahamad_Resume.png, certs/, certificates*.json from this folder)

# 4. Stage, commit, push
git add -A
git commit -m "Comic-themed portfolio with 44 certificates + Spider-Man web"
git push origin main
```

Then on GitHub: **Settings → Pages → Source: Deploy from branch → Branch: `main` / root → Save**.
Your site will be live at `https://phantomsafeeq.github.io/portfolio/` in 1–2 minutes.

### Option B — Create a new repo (keeps the old portfolio untouched)

1. Go to https://github.com/new
2. Repository name: e.g. `comic-portfolio` (or any name you want)
3. **Public**, no README, no .gitignore — click **Create repository**
4. Then run:

```bash
cd /path/to/this/folder
./deploy.sh comic-portfolio
```

The deploy script will:
- Set the remote to `https://github.com/Phantomsafeeq/comic-portfolio.git`
- Push all files to `main`
- Print the URL to enable Pages

5. On GitHub: **Settings → Pages → Source: Deploy from branch → Branch: `main` / root → Save**.
Your site will be live at `https://phantomsafeeq.github.io/comic-portfolio/` in 1–2 minutes.

### Option C — Push using `gh` CLI (if installed)

```bash
gh repo create Phantomsafeeq/comic-portfolio --public --source=. --push
gh api -X POST /repos/Phantomsafeeq/comic-portfolio/pages -f source[branch]=main -f source[path]=/
```

## One-command deploy script

```bash
./deploy.sh <your-repo-name>
```

The script:
1. Sets the git remote to `https://github.com/Phantomsafeeq/<repo-name>.git`
2. Commits all changes
3. Pushes to `main`
4. Opens your browser to the GitHub Pages settings

## Tech

- Single HTML file (no build step)
- Google Fonts via `@import` (Bangers, Luckiest Guy, Comic Neue)
- Vanilla JS for modals, filters, view switching, scroll-based Spider-Man web animation
- No frameworks, no dependencies

## License

Personal portfolio content © Safeeq Ahamad S.S. Code structure free to reuse.
