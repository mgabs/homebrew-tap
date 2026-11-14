cask "hidden-bar" do
  version "1.12"
  sha256 "f51c72ea863d647c5d7f2776c9835ac43683a500f37eba10cb43aba75f89171a"

  url "https://github.com/mgabs/hidden/releases/download/v#{version}/Hidden-Bar-#{version}.zip"
  name "Hidden Bar"
  desc "Ultra-light utility that helps hide menu bar icons"
  homepage "https://github.com/mgabs/hidden"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Hidden Bar.app"

  postflight_steps do
    run "xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Hidden Bar.app"],
        must_succeed: false
  end

  uninstall quit: "com.mgabs.hiddenbar"

  zap trash: [
    "~/Library/Application Support/com.mgabs.hiddenbar",
    "~/Library/Caches/com.mgabs.hiddenbar",
    "~/Library/Preferences/com.mgabs.hiddenbar.plist",
  ]

  caveats <<~EOS
    If macOS blocks launch with a malware warning or error -128, run:
      xattr -dr com.apple.quarantine "/Applications/Hidden Bar.app"
  EOS
end
