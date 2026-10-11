class Look < Formula
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"
  version "0.8.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
      sha256 "dd2da399f08385acc2486f3fa972cf115e627d26677e5989256fe3cf6fd68ca4"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lookapp"
        ln_sf "#{bin}/lookapp", "#{bin}/lgtm"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
      sha256 "5eca62a8ba9a2e3415af22f0357cf166b47a616411ee3bfdcdb4b1a724b44bf8"

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
