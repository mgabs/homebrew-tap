cask "amethyst" do
  version "0.28.0,1575"
  sha256 "f9b4220e08251a97199c2e1307a861fb5d79420b6f63402601bb3d2b2e5365b7"

  url "https://github.com/mgabs/Amethyst/releases/download/v#{version.csv.first}/Amethyst-v#{version.csv.first}-b#{version.csv.second}.zip"
  name "Amethyst"
  desc "Automatic tiling window manager similar to xmonad (mgabs fork)"
  homepage "https://github.com/mgabs/Amethyst"

  livecheck do
    url "https://github.com/mgabs/Amethyst/releases/latest/download/appcast.xml"
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
