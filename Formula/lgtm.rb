class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  url "https://github.com/mgabs/lgtm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1e8b1ac77c5d80de453a9ed9058e17ef68183cb9284cf774d069a93fbb467010"
  license "MIT"
  head "https://github.com/mgabs/lgtm.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
