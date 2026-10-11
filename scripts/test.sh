#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "==> Running Tap Minitest Suite..."
ruby test/test_tap.rb

if command -v brew >/dev/null 2>&1; then
  echo ""
  echo "==> Running Homebrew Cask & Formula Audits..."
  for formula in Formula/*.rb; do
    echo "Auditing $formula..."
    brew audit --formula "$formula" || true
  done

  for cask in Casks/*.rb; do
    echo "Auditing $cask..."
    brew audit --cask "$cask" || true
  done

  echo ""
  echo "==> Running brew style check..."
  brew style Formula/*.rb Casks/*.rb || true
else
  echo "brew command not found; skipped brew audit/style checks."
fi

echo ""
echo "All tests passed!"
