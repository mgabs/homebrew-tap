class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.4.0/lgtm-v2.4.0-darwin-arm64.tar.gz"
      sha256 "be767c9df7b72dfdca15fba568ac54ebb0903095b43d5c5bb17cecd9c064b28e"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.4.0/lgtm-v2.4.0-darwin-arm64.tar.gz"
      sha256 "be767c9df7b72dfdca15fba568ac54ebb0903095b43d5c5bb17cecd9c064b28e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.4.0/lgtm-v2.4.0-linux-x86_64.tar.gz"
      sha256 "cdf839572aefd0d869fbed90f2731569b23d8d5161d466da222635daacebe8fd"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
