class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.7.0/lgtm-v0.7.0-darwin-arm64.tar.gz"
      sha256 "8c1df2380c0301eab8a0519acfdc2c5d993e194a4371429baf97178522c7e3e0"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.7.0/lgtm-v0.7.0-darwin-arm64.tar.gz"
      sha256 "8c1df2380c0301eab8a0519acfdc2c5d993e194a4371429baf97178522c7e3e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.7.0/lgtm-v0.7.0-linux-x86_64.tar.gz"
      sha256 "f26741f8a6d5952c15775dd16d0a4bf846d5e02f539aad8d195361f8ef6f5af3"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
