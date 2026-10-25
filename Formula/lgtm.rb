class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.0.0/lgtm-v2.0.0-darwin-arm64.tar.gz"
      sha256 "fc1d2bee0c441a4b2c9f4fc4b65e7dfb7a993302968eb369af82f3bda0adbc76"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.0.0/lgtm-v2.0.0-darwin-arm64.tar.gz"
      sha256 "fc1d2bee0c441a4b2c9f4fc4b65e7dfb7a993302968eb369af82f3bda0adbc76"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.0.0/lgtm-v2.0.0-linux-x86_64.tar.gz"
      sha256 "93e7b14735c0032cb50f5185f7d06395dcc9a86bc45178d28732e61dc0c865e9"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
