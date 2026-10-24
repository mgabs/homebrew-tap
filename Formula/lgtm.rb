class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v1.0.1/lgtm-v1.0.1-darwin-arm64.tar.gz"
      sha256 "1fa73bfa8668fd624b3a3adea34d7c01553788bd0d7a2643a9fe1efecb2661d2"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v1.0.1/lgtm-v1.0.1-darwin-arm64.tar.gz"
      sha256 "1fa73bfa8668fd624b3a3adea34d7c01553788bd0d7a2643a9fe1efecb2661d2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v1.0.1/lgtm-v1.0.1-linux-x86_64.tar.gz"
      sha256 "5cf91d237b841dd9fd43d21e43cccea2729a29d2b4033bd57d754c15f9cc0928"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
