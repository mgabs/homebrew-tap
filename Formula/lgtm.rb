class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.9.1/lgtm-v0.9.1-darwin-arm64.tar.gz"
      sha256 "38943dc6753432575c1a8c66f5a402a67afdb06307a547aa03b00ba7dc0569c5"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.9.1/lgtm-v0.9.1-darwin-arm64.tar.gz"
      sha256 "38943dc6753432575c1a8c66f5a402a67afdb06307a547aa03b00ba7dc0569c5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.9.1/lgtm-v0.9.1-linux-x86_64.tar.gz"
      sha256 "d3ea2eef645d534e637b721890439cb3a1e47d3dc92cfac59e33594fb7b07fdf"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
