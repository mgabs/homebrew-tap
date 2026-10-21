class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v1.0.0/lgtm-v1.0.0-darwin-arm64.tar.gz"
      sha256 "c3f5ec548298c57d3de4315cec211e481f3d0abe0e9e69f1dcca1e395a4323d1"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v1.0.0/lgtm-v1.0.0-darwin-arm64.tar.gz"
      sha256 "c3f5ec548298c57d3de4315cec211e481f3d0abe0e9e69f1dcca1e395a4323d1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v1.0.0/lgtm-v1.0.0-linux-x86_64.tar.gz"
      sha256 "04cda10e53e33d534c9b51d8d9cf56ddf63279839102a8b02a39a138b2ef978e"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
