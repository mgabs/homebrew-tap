class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.5.0/lgtm-v2.5.0-darwin-arm64.tar.gz"
      sha256 "ac62cc2b11bda04b05099c2023261407cf9b30dd772cfdada00782be4ebdf2ec"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.5.0/lgtm-v2.5.0-darwin-arm64.tar.gz"
      sha256 "ac62cc2b11bda04b05099c2023261407cf9b30dd772cfdada00782be4ebdf2ec"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.5.0/lgtm-v2.5.0-linux-x86_64.tar.gz"
      sha256 "c5118ebf9298b4f8be16728839e858d2b73756030657cad80d7e9cc8947297d2"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
