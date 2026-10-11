class Lgtm < Formula
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"
  version "0.8.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
      sha256 "75ff14f77cfb83f533bbd327f955d9aaa36ca0646b4e107648f4ebd3b868a937"

      def install
        prefix.install "Look.app"
        bin.write_exec_script "#{prefix}/Look.app/Contents/MacOS/Look"
        mv "#{bin}/Look", "#{bin}/lgtm"
        ln_sf "#{bin}/lgtm", "#{bin}/lookapp"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
      sha256 "139475c04985a4807e636952624bcd96a7d731b03e68b6387273cafa0c2673e2"

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
