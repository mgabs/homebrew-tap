class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.0/lgtm-v0.8.0-darwin-arm64.tar.gz"
      sha256 "c1b0f89097de1c801491cdb3cfc262710ebb1b7572085d74bfb8428ff7bd17b8"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.0/lgtm-v0.8.0-darwin-arm64.tar.gz"
      sha256 "c1b0f89097de1c801491cdb3cfc262710ebb1b7572085d74bfb8428ff7bd17b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.0/lgtm-v0.8.0-linux-x86_64.tar.gz"
      sha256 "a7f84c37510325747a6eebf0c565941c0997615e0d4fa71b4e8fa52f73792e62"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
