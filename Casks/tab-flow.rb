cask "tab-flow" do
  version "1.0.1"
  sha256 "e9ee8ea8aa846340841114a7828b51a5c4aea1583cda7bab966261cb92c7a0cc"

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
