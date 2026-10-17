class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.3/lgtm-v0.8.3-darwin-arm64.tar.gz"
      sha256 "fdc860e2334e09885cdc0479395cff511482c024bd5d42442d6e6e92e1d79459"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.3/lgtm-v0.8.3-darwin-arm64.tar.gz"
      sha256 "fdc860e2334e09885cdc0479395cff511482c024bd5d42442d6e6e92e1d79459"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.3/lgtm-v0.8.3-linux-x86_64.tar.gz"
      sha256 "d5a19bfcd3f1e8e194102eb2658d564b451f671d9210c5cc40d96ba160a93079"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
