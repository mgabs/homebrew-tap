class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "b9ba390e038f72defa4aa13fb106c5a69a69aa54fec620da2c1ab816b37f312b"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "b9ba390e038f72defa4aa13fb106c5a69a69aa54fec620da2c1ab816b37f312b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-linux-x86_64.tar.gz"
      sha256 "8dfe5ee87f9adb03c7db9675e9e8c6d004ac755092272afdba9c4acb3672d0c4"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
