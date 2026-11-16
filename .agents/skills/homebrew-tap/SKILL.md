---
name: homebrew-tap
description: >-
  Best practices, maintenance guidelines, and audit compliance for Homebrew taps,
  formulae, and casks. Use when adding or editing casks/formulae, diagnosing brew audit
  failures, or updating installation lifecycle hooks.
---

# Homebrew Tap Maintenance & Authoring Guide

Evolved from live AGY session trajectory audits. Encapsulates strict audit compliance and modern Cask/Formula DSL patterns.

---

## 1. Cask Lifecycle Steps (`postflight_steps`)

> [!WARNING]
> `postflight do ... end` and `preflight do ... end` are deprecated in modern Homebrew. Always use declarative `postflight_steps` and `preflight_steps`.

### Quarantine Attribute Removal Pattern
Do not call `system_command`. Use `run` inside `postflight_steps` with `{{appdir}}` token:

```ruby
  postflight_steps do
    run "xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/AppName.app"],
        must_succeed: false
  end
```

Key requirements:
- Use `run` instead of `system_command`.
- Use template token `{{appdir}}` instead of string interpolation `#{appdir}` (avoids DSL scope leakage).
- Set `must_succeed: false` to avoid failing installation if quarantine attribute is absent.

---

## 2. Formula Version Redundancy Rules

> [!IMPORTANT]
> Under `brew audit --strict`, declaring `version` when the download URL embeds the version string is a hard failure (`Stable: version X is redundant with version scanned from URL`).

### Rule:
- **Do not include** an explicit `version` stanza if GitHub release or archive URL contains `vX.Y.Z` or `<name>-v?X.Y.Z.tar.gz`.
- **Only include** `version` if:
  1. The URL has no semantic version tag.
  2. The version string diverges from the URL tag.

---

## 3. Strict Pre-Commit & Audit Verification

Always verify tap changes with strict audit before committing:

```bash
# Run tap unit tests (works in sandbox)
make test

# Audit a specific formula/cask (file paths are disabled in modern Homebrew)
rtk brew audit --cask --strict <user>/<repo>/<cask>

# Audit full tap strictly
rtk brew audit --tap <user>/<repo> --strict

# Check style
rtk brew style Formula/*.rb Casks/*.rb
```

### Sandboxing Notes
- **Git (`add`/`commit`)**: `.git/index.lock` creation may fail with `Operation not permitted` in sandbox; re-run with `BypassSandbox: true`.
- **`brew style` / `brew audit`**: Portable Ruby / Bundler reads `/etc/resolv.conf` and may fail with `Errno::EPERM`; re-run with `BypassSandbox: true`.
