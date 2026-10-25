class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "0c686eb44b01dfcde3914218446432c9390e214452fc002e7e415cebf4a58ed1"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "0c686eb44b01dfcde3914218446432c9390e214452fc002e7e415cebf4a58ed1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-linux-x86_64.tar.gz"
      sha256 "0636e82bdd929072944034041535571730b9899410b7dd3e0995d7a565f8af1f"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
