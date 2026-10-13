class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "d8cc196dd214b6bab5588471886b30b97704bed93ea5d561b5cd577fcbe8aa4d"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "d8cc196dd214b6bab5588471886b30b97704bed93ea5d561b5cd577fcbe8aa4d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-linux-x86_64.tar.gz"
      sha256 "1d7adaeeec52fb3c90c71a8cbc72af6381f00699cb2389b017905bb8498ca177"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
