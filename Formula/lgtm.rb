class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "2.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.1/lgtm-v2.6.1-darwin-arm64.tar.gz"
      sha256 "22111a5e073dcea043ded53ea32557ddd383f2a974b8ca8c3aa197964fb52d66"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.1/lgtm-v2.6.1-darwin-arm64.tar.gz"
      sha256 "22111a5e073dcea043ded53ea32557ddd383f2a974b8ca8c3aa197964fb52d66"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v2.6.1/lgtm-v2.6.1-linux-x86_64.tar.gz"
      sha256 "d163cc4fea380f711e0bbafabfe6d0ecb414b6757524da499a345b0e8446090d"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
