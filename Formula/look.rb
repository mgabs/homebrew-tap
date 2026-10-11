class Look < Formula
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
      sha256 "340793a7a1fb5ce2c4b61915ee65d3f5df4e09466206c92d34354bb8a0d37bc1"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lookapp"
        ln_sf "#{bin}/lookapp", "#{bin}/lgtm"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
      sha256 "50a4b5ae5e97e373002a7422ceaebb0fefb5a2b8f761b2fb80a357c290c5dd9b"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lookapp"
        ln_sf "#{bin}/lookapp", "#{bin}/lgtm"
      end
    end
  end

  def caveats
    <<~EOS
      Look.app has been installed to #{opt_prefix}/Look.app.
      CLI binary available as 'lookapp' and 'lgtm'.
    EOS
  end

  test do
    assert_predicate prefix/"Look.app", :exist?
  end
end
