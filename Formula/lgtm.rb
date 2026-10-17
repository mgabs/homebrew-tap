class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "127c93b56660624d3612154588c8ae1bc33bd452df6cca821710ca4545962d8f"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "127c93b56660624d3612154588c8ae1bc33bd452df6cca821710ca4545962d8f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-linux-x86_64.tar.gz"
      sha256 "75d7c6120addc8bf63bcd742714edb1b1e1dfd40c7b43463b6309a8e823f5689"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
