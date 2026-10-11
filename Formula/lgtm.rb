class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-darwin-arm64.tar.gz"
    sha256 "aa4a322bb37a8cc1cd23ca67fac18ce99212848634cbdedc9cec328a86610457"
  end

  on_linux do
    url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-linux-x86_64.tar.gz"
    sha256 "8cec4af35e12bc2669d3e50e772e85746dee408adb1e1ddd97b2af0496df91df"
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
