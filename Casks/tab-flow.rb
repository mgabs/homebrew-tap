cask "tab-flow" do
  version "1.0.0"
  sha256 "5bd87230bbb6a4c937307a6efe043d82b7d130c10f4aee6b6c279972316349c6"

  url "https://github.com/mgabs/tab-flow/releases/download/v#{version}/TabFlow-#{version}.zip"
  name "TabFlow"
  desc "Alt-Tab window switcher for macOS"
  homepage "https://tabflow.app/"

  livecheck do
    url "https://raw.githubusercontent.com/mgabs/tab-flow/master/build/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :monterey

  app "TabFlow.app"

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
