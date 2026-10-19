cask "amethyst" do
  version "Amethyst-v0.28.0-b1575.dSYM.zip,Amethyst-v0.28.0-b1575.dSYM.zip"
  sha256 "29e7a27f8f751a6d7fcf19d22fd86bb053928a8d725f12fc51f895a1920213f2"

  url "https://github.com/mgabs/Amethyst/releases/download/v#{version.csv.first}/Amethyst-v#{version.csv.first}-b#{version.csv.second}.zip"
  name "Amethyst"
  desc "Automatic tiling window manager similar to xmonad (mgabs fork)"
  homepage "https://github.com/mgabs/Amethyst"

  livecheck do
    url "https://raw.githubusercontent.com/mgabs/Amethyst/master/build/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :monterey

  app "Amethyst.app"

  zap trash: [
    "~/Library/Application Support/Amethyst",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.amethyst.amethyst.sfl*",
    "~/Library/Caches/com.amethyst.Amethyst",
    "~/Library/Cookies/com.amethyst.Amethyst.binarycookies",
    "~/Library/HTTPStorages/com.amethyst.Amethyst",
    "~/Library/Preferences/com.amethyst.Amethyst.plist",
  ]
end
