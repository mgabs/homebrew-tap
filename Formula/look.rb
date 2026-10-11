class Look < Formula
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"
  version "0.8.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
      sha256 "e0185360e613d90f5cb21101379e396f99e73a0539d7603f64ecb8d863212347"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lookapp"
        ln_sf "#{bin}/lookapp", "#{bin}/lgtm"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
      sha256 "6c5249d9ef69349a74c67206bb91f049fba5243e9a41e4fa2a0470bd967718e9"

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
