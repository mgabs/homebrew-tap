class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-darwin-arm64.tar.gz"
      sha256 "49db4d9c2294d61e0f65428701362137440df8eaff34f304745717e5d7c0f7c8"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-darwin-arm64.tar.gz"
      sha256 "49db4d9c2294d61e0f65428701362137440df8eaff34f304745717e5d7c0f7c8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.3.0/lgtm-v0.3.0-linux-x86_64.tar.gz"
      sha256 "d009575122b9850abe870afd25fe3d930fcbc7bfa1a039deb810d9a3ecb324fd"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
