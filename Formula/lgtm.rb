class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.0/lgtm-v2.6.0-darwin-arm64.tar.gz"
      sha256 "503455dcff5c2a9b567b490c03cef2b022d1c02f9c805e790cda4b73fce832eb"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.0/lgtm-v2.6.0-darwin-arm64.tar.gz"
      sha256 "503455dcff5c2a9b567b490c03cef2b022d1c02f9c805e790cda4b73fce832eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.0/lgtm-v2.6.0-linux-x86_64.tar.gz"
      sha256 "7069ae748e42dd1f6c44fac2d43dda205445fd3603ec77e01f4b96663aeb6bd0"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
