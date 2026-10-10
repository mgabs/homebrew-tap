class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.1.0/lgtm-v0.1.0-darwin-arm64.tar.gz"
      sha256 "7dd77c991f34fe28cd3b28994d2feaf8ee05f3fed1ddf07bd822914cf749a639"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.1.0/lgtm-v0.1.0-darwin-arm64.tar.gz"
      sha256 "7dd77c991f34fe28cd3b28994d2feaf8ee05f3fed1ddf07bd822914cf749a639"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.1.0/lgtm-v0.1.0-linux-x86_64.tar.gz"
      sha256 "fb8da40a071176469300e8a65e2c436cbe37da79cad7c9a73488d4662be15db8"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
