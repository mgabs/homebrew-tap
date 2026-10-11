class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-darwin-arm64.tar.gz"
      sha256 "3d601ddf7a41f0ef1af2153623a9537b2a11e067c46d5a04ae330908d23266e8"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-darwin-arm64.tar.gz"
      sha256 "3d601ddf7a41f0ef1af2153623a9537b2a11e067c46d5a04ae330908d23266e8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-linux-x86_64.tar.gz"
      sha256 "f9912fb588fe3f135162466d7b5c45e0371c95178da741326e1ea3cc13aa1e66"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
