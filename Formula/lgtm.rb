class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.1.1/lgtm-v0.1.1-darwin-arm64.tar.gz"
      sha256 "b46db73f08547bb59caa7dcea04ba107fd15fd259bdd5c556d4a2d2d65be5ed7"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.1.1/lgtm-v0.1.1-darwin-arm64.tar.gz"
      sha256 "b46db73f08547bb59caa7dcea04ba107fd15fd259bdd5c556d4a2d2d65be5ed7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.1.1/lgtm-v0.1.1-linux-x86_64.tar.gz"
      sha256 "df03421373c66e44b8ae44ca7e1831ea5fdb36de63f0615f69eb0655c247a0ce"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
