class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.4.0/lgtm-v0.4.0-darwin-arm64.tar.gz"
      sha256 "5793648cc185c5ffb6415cef674227f6c1c20324c360703366325a304be062ee"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.4.0/lgtm-v0.4.0-darwin-arm64.tar.gz"
      sha256 "5793648cc185c5ffb6415cef674227f6c1c20324c360703366325a304be062ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.4.0/lgtm-v0.4.0-linux-x86_64.tar.gz"
      sha256 "f6f653d5f7c7698ad76c464e05091a394e07fb62f3d36ecb36c4aad369d1f64e"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
