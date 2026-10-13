class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "62b9a68409ded09ae3226c7fda0a1f7c83e8c882bae7989cb71201a406fab93a"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "62b9a68409ded09ae3226c7fda0a1f7c83e8c882bae7989cb71201a406fab93a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-linux-x86_64.tar.gz"
      sha256 "c4c22bdb51a779298231361aa9d39b77d0b0b8314359ca65352a0f5a8329b43b"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
