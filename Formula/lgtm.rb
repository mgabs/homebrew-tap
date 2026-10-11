class Lgtm < Formula
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
      sha256 "d4b3771e07ee30f1b2a7cb7c6b93c3028a07bda8c772a373383ce13a16b8f1d6"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lgtm"
        ln_sf "#{bin}/lgtm", "#{bin}/lookapp"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
      sha256 "cddc5b9a36942649edbf1a6660d8a02b813f5ddce029176a442830df052db34b"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lgtm"
        ln_sf "#{bin}/lgtm", "#{bin}/lookapp"
      end
    end
  end

  def caveats
    <<~EOS
      Look.app has been installed to #{opt_prefix}/Look.app.
      CLI binary available as 'lgtm' and 'lookapp'.
    EOS
  end

  test do
    assert_predicate prefix/"Look.app", :exist?
  end
end
