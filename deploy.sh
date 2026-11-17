#!/usr/bin/env bash
# deploy.sh — push the comic portfolio to GitHub and prepare for GitHub Pages
#
# Usage:
#   ./deploy.sh <repo-name>
#
# Example:
#   ./deploy.sh comic-portfolio
#
# Prerequisites:
#   - Git installed (https://git-scm.com/)
#   - A GitHub account (https://github.com/)
#   - Either:
#       (a) Git credentials cached via `git config --global credential.helper store`
#           and once you push, GitHub will prompt for username + Personal Access Token
#       (b) GitHub CLI `gh` installed and authenticated via `gh auth login`
#       (c) An SSH key added to your GitHub account (then edit the REMOTE below to use git@)

set -e

REPO_NAME="${1:-portfolio}"
GITHUB_USER="Phantomsafeeq"
REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Comic Portfolio → GitHub → GitHub Pages"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "GitHub user : ${GITHUB_USER}"
echo "Repo name   : ${REPO_NAME}"
echo "Remote URL  : ${REMOTE_URL}"
echo ""
echo "Step 1 — making sure we're in a git repo..."
if [ ! -d .git ]; then
  git init -b main
  git config user.email "safeeq9965@gmail.com"
  git config user.name "Safeeq Ahamad S.S"
fi

echo "Step 2 — staging all files..."
git add -A

echo "Step 3 — committing..."
if git diff --cached --quiet; then
  echo "  (nothing new to commit)"
else
  git commit -m "Comic-themed portfolio with 44 certificates + Spider-Man web"
fi

echo "Step 4 — setting remote origin..."
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "${REMOTE_URL}"
else
  git remote add origin "${REMOTE_URL}"
fi

echo "Step 5 — pushing to GitHub..."
echo "  (if prompted, use your GitHub username + a Personal Access Token as password)"
echo "  (create a token at: https://github.com/settings/tokens — needs 'repo' scope)"
git push -u origin main

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  PUSH COMPLETE — now enable GitHub Pages"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Open:  https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
echo "2. Under 'Build and deployment' → 'Source':  choose  'Deploy from a branch'"
echo "3. Under 'Branch':  select  'main'  and  '/ (root)'  → click  'Save'"
echo "4. Wait 60–120 seconds, then visit:"
echo ""
echo "   https://${GITHUB_USER}.github.io/${REPO_NAME}/"
echo ""
echo "(If the repo is named '${GITHUB_USER}.github.io' the URL will be https://${GITHUB_USER}.github.io/)"
echo ""

# Try to open the Pages settings in the default browser
if command -v xdg-open >/dev/null 2>&1; then
  xdg-open "https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages" 2>/dev/null || true
elif command -v open >/dev/null 2>&1; then
  open "https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages" 2>/dev/null || true
fi

echo "Done."
