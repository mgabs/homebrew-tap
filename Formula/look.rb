class Look < Formula
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"
  version "0.7.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
      sha256 "fbba7c99409aa2bf747b181d9e5fdc4a9b69f4951ded3d1ae7e14d0f14b0e017"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lookapp"
        ln_sf "#{bin}/lookapp", "#{bin}/lgtm"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
      sha256 "23baf5b37686a6de931e2314041676ca71f8ffb5e4991cf01d61b2b45394ccff"

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
