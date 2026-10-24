class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v1.1.0/lgtm-v1.1.0-darwin-arm64.tar.gz"
      sha256 "b7ed49fe1295abc8c2b986e1b3085cfe70837748890e42999fd27d70bc9134ef"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v1.1.0/lgtm-v1.1.0-darwin-arm64.tar.gz"
      sha256 "b7ed49fe1295abc8c2b986e1b3085cfe70837748890e42999fd27d70bc9134ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v1.1.0/lgtm-v1.1.0-linux-x86_64.tar.gz"
      sha256 "70f4fc765654dc02581cc40931258772125bca76c51eea0bd5a711b939e06eeb"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
