class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.7.0/lgtm-v2.7.0-darwin-arm64.tar.gz"
      sha256 "0f840245372f8c2535bd6830daa2a389869fa18460f3866e5af5dc9a4cfcf04e"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.7.0/lgtm-v2.7.0-darwin-arm64.tar.gz"
      sha256 "0f840245372f8c2535bd6830daa2a389869fa18460f3866e5af5dc9a4cfcf04e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.7.0/lgtm-v2.7.0-linux-x86_64.tar.gz"
      sha256 "64b40332675e5e16526480891c78ca66070ef3fb67375431fcff1a2a450e3a8f"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
