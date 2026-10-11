# Homebrew Tap (mgabs)

Custom Homebrew tap for macOS applications and CLI developer tools.

## Formulae (CLI Tools)

- **LGTM**: Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust.
  ```bash
  brew install mgabs/tap/lgtm
  ```

## Casks (macOS Apps)

- **Amethyst** (Fork): `brew install --cask mgabs/tap/amethyst`
- **LGTM**: `brew install --cask mgabs/tap/lgtm`
- **Look**: `brew install --cask mgabs/tap/look`
- **TabFlow**: `brew install --cask mgabs/tap/tab-flow`

## Installation

```bash
# Add tap
brew tap mgabs/tap

# Install lgtm CLI
brew install lgtm

# Install macOS GUI apps
brew install --cask look
brew install --cask tab-flow
```

## Updates

```bash
brew update
brew upgrade lgtm
brew upgrade --cask look
brew upgrade --cask tab-flow
```

## Troubleshooting Gatekeeper / Quarantine (Casks)

If macOS blocks launch with a malware warning or error `-128` (if self-signed), remove the quarantine attribute:

```bash
xattr -dr com.apple.quarantine /Applications/Look.app
xattr -dr com.apple.quarantine /Applications/TabFlow.app
```
