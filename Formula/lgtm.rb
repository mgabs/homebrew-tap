class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "ef84b37338a546f74d9fcbb12e160fdd815ee40894eddbe5fc3dc073f65c05a7"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "ef84b37338a546f74d9fcbb12e160fdd815ee40894eddbe5fc3dc073f65c05a7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-linux-x86_64.tar.gz"
      sha256 "9abaab04b3a9f690d2f1e1253e1c879547e70ba7e4a54111c2243bf4a1719012"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
