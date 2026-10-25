class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.3.0/lgtm-v2.3.0-darwin-arm64.tar.gz"
      sha256 "3820d8ed6a578c29e0eb5794a9e5163ac34a6aa28c806f04700089b85304df26"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.3.0/lgtm-v2.3.0-darwin-arm64.tar.gz"
      sha256 "3820d8ed6a578c29e0eb5794a9e5163ac34a6aa28c806f04700089b85304df26"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.3.0/lgtm-v2.3.0-linux-x86_64.tar.gz"
      sha256 "4f2d2e45e604c4ffe9b65f96581ab25e955a89ea36dd4a2015611fc04ff214f5"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
