class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.5.0/lgtm-v0.5.0-darwin-arm64.tar.gz"
      sha256 "a7fa802c0315514f51096932bb1bcf0125596dea5a07bc722c152ace9224d0e4"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.5.0/lgtm-v0.5.0-darwin-arm64.tar.gz"
      sha256 "a7fa802c0315514f51096932bb1bcf0125596dea5a07bc722c152ace9224d0e4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.5.0/lgtm-v0.5.0-linux-x86_64.tar.gz"
      sha256 "fb476bd620532d4c5f133bc77c8c3e27c666cceb78714347abf758590bcfc1ee"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
