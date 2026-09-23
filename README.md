# Homebrew Tap (mgabs)

Custom Homebrew tap for macOS applications.

## Casks

- **Amethyst** (Fork): `brew install --cask mgabs/tap/amethyst`
- **TabFlow**: `brew install --cask mgabs/tap/tab-flow`

## Installation

```bash
brew tap mgabs/tap
brew install --cask tab-flow
```

Or install directly:

```bash
brew install --cask mgabs/tap/tab-flow
```

## Updates

Apps include built-in auto-updates via Sparkle. You can also update via Homebrew:

```bash
brew upgrade --cask tab-flow
```

## Troubleshooting Gatekeeper / Quarantine

If macOS blocks launch with a malware warning or error `-128` (if self-signed), remove the quarantine attribute:

```bash
xattr -dr com.apple.quarantine /Applications/TabFlow.app
```
