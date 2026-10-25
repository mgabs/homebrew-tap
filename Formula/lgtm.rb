class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.1.0/lgtm-v2.1.0-darwin-arm64.tar.gz"
      sha256 "154ec803c71f9e4e523e96641716b0f43749d0c925d766b13c18b96eee2c7926"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.1.0/lgtm-v2.1.0-darwin-arm64.tar.gz"
      sha256 "154ec803c71f9e4e523e96641716b0f43749d0c925d766b13c18b96eee2c7926"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.1.0/lgtm-v2.1.0-linux-x86_64.tar.gz"
      sha256 "f9087365e5cebf459011971c392fc09c6e3b75c3dbcf47680f285c55b888ff58"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
