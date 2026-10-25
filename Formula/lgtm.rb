class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.1.0/lgtm-v2.1.0-darwin-arm64.tar.gz"
      sha256 "ffc222cd23163a4ef3883ba6f628d582efa393394c54ec656188d8cb9774498b"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.1.0/lgtm-v2.1.0-darwin-arm64.tar.gz"
      sha256 "ffc222cd23163a4ef3883ba6f628d582efa393394c54ec656188d8cb9774498b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.1.0/lgtm-v2.1.0-linux-x86_64.tar.gz"
      sha256 "22ca1ca06a7a546e7919f64f5ff9a2ce6982feaf86b75b73bc173fdb348f92c2"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
