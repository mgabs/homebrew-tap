class Lgtm < Formula
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
      sha256 "4b9fdc0472edbc9269f3a2a4be4edb5083851b59cbbd76427f1b3e707168c1b0"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lgtm"
        ln_sf "#{bin}/lgtm", "#{bin}/lookapp"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
      sha256 "f2be9d33ab1a5ce816d28992aa09889a746c2ba2696424583038e0c16e35944f"

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
