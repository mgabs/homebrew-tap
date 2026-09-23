# Homebrew Tap for Amethyst (Fork)

Custom Homebrew tap for [Amethyst](https://github.com/mgabs/Amethyst) (mgabs fork).

## Installation

```bash
brew tap mgabs/tap
brew install --cask amethyst
```

Or as a single command:

```bash
brew install --cask mgabs/tap/amethyst
```

## Updates

Amethyst includes built-in auto-updates via Sparkle. You can also update via Homebrew:

```bash
brew upgrade --cask amethyst
```

## Troubleshooting Gatekeeper / Malware Warning

If macOS blocks Amethyst with a malware warning or error `-128` (since the fork is signed but not notarized), remove the quarantine attribute:

```bash
xattr -dr com.apple.quarantine /Applications/Amethyst.app
```

