class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "9587d3d08b09a411074ed8810970813526f5be1eef9dc3407c2b203982fbfb82"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "9587d3d08b09a411074ed8810970813526f5be1eef9dc3407c2b203982fbfb82"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-linux-x86_64.tar.gz"
      sha256 "606783ecb43ad87cce561a9e3014990de5da4ff5dae05f67a169899c7f9259ca"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
