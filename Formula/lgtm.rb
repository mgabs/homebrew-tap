class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.8.1/lgtm-v2.8.1-darwin-arm64.tar.gz"
      sha256 "6cb24228d02ed5d6af7add92f2517f3c0f31daf729c14c799037ded271d15a4a"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.8.1/lgtm-v2.8.1-darwin-arm64.tar.gz"
      sha256 "6cb24228d02ed5d6af7add92f2517f3c0f31daf729c14c799037ded271d15a4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.8.1/lgtm-v2.8.1-linux-x86_64.tar.gz"
      sha256 "ebdd9549da46eaaaf3fe2500a075e2e42f3b2b0101261f724823c200d2390e68"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
