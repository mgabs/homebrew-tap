cask "tab-flow" do
  version "1.3.0"
  sha256 "670d13d9cc0bf03743058559dfb16124a5adf5177531def6001bfb77fdb9886d"

  url "https://github.com/mgabs/tab-flow/releases/download/v#{version}/TabFlow-#{version}.zip"
  name "TabFlow"
  desc "Alt-Tab window switcher for macOS"
  homepage "https://tabflow.app/"

  livecheck do
    url "https://raw.githubusercontent.com/mgabs/tab-flow/master/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :monterey

  app "TabFlow.app"

  postflight do
    system_command "xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/TabFlow.app"],
                   must_succeed: false
  end

  uninstall quit: "com.mgabs.tabflow-macos"

  zap trash: [
    "~/Library/Application Support/com.mgabs.tabflow-macos",
    "~/Library/Caches/com.mgabs.tabflow-macos",
    "~/Library/Cookies/com.mgabs.tabflow-macos.binarycookies",
    "~/Library/HTTPStorages/com.mgabs.tabflow-macos",
    "~/Library/Preferences/com.mgabs.tabflow-macos.plist",
  ]

  caveats <<~EOS
    If macOS blocks launch with a malware warning or error -128, run:
      xattr -dr com.apple.quarantine /Applications/TabFlow.app
  EOS
end
