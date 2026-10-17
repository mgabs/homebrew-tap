class Lgtm < Formula
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "2a7b9f159539da9171212977634d9a5766a26d73b5ad7b16be480e3d5b1565ff"
    else
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-darwin-arm64.tar.gz"
      sha256 "2a7b9f159539da9171212977634d9a5766a26d73b5ad7b16be480e3d5b1565ff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mgabs/lgtm/releases/download/v0.8.2/lgtm-v0.8.2-linux-x86_64.tar.gz"
      sha256 "43cb80df0e559a7b6061b62819f9d3b8e84babe51aad1ece4bae7219f69daa9a"
    end
  end

  def install
    bin.install "lgtm"
  end

  test do
    assert_match "Real-Time Terminal Diff Reviewer", shell_output("#{bin}/lgtm --help")
  end
end
