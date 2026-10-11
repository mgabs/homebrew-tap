class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.6.0/lgtm-v0.6.0-darwin-arm64.tar.gz"
      sha256 "971f9f82f1070db1ddc9a1f280e122ffe553654777c20db1bac2174786907ba2"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.6.0/lgtm-v0.6.0-darwin-arm64.tar.gz"
      sha256 "971f9f82f1070db1ddc9a1f280e122ffe553654777c20db1bac2174786907ba2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.6.0/lgtm-v0.6.0-linux-x86_64.tar.gz"
      sha256 "3582742443589a06d05df7e6d37e0b6cc48c34de5a033f48ab8b2e25acd88faf"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
