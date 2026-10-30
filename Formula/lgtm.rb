class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.0/lgtm-v2.6.0-darwin-arm64.tar.gz"
      sha256 "e0cf4101d4a7b18b0dc0d81a2c16a9b52dad7b39cc4ba8111e72c50504619f46"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.0/lgtm-v2.6.0-darwin-arm64.tar.gz"
      sha256 "e0cf4101d4a7b18b0dc0d81a2c16a9b52dad7b39cc4ba8111e72c50504619f46"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.0/lgtm-v2.6.0-linux-x86_64.tar.gz"
      sha256 "1980bd55ce0a4f16899edd3df793a4fc87cb7e3b40363e2c3c44eb0f317d721f"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
