#!/usr/bin/env bash
set -e

echo "Previewing site..."
quarto render

echo ""
echo "Git status:"
git status --short

echo ""
echo "Staging website source files..."
git add -A index.qmd _quarto.yml .gitignore pages/ images/ pdfs/ scripts/

echo ""
echo "Staged files:"
git diff --cached --name-only

echo ""
echo "Staged summary:"
git diff --cached --stat

echo ""
echo "Review the list above."
echo "If everything looks correct, run:"
echo '  git commit -m "Describe your change"'
echo "  git push"
echo "  quarto publish gh-pages"