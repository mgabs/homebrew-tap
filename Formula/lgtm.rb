class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "7f2704b217783d08cbcadec16cf9d4b65b0e568c91d6d33183bb0fdb33507c20"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-darwin-arm64.tar.gz"
      sha256 "7f2704b217783d08cbcadec16cf9d4b65b0e568c91d6d33183bb0fdb33507c20"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.2.0/lgtm-v2.2.0-linux-x86_64.tar.gz"
      sha256 "0140e8e99e400293e5e8838e7c970391e0c81078946d2da878ce3fbd2b56b5a5"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
