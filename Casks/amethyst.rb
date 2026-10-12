cask "amethyst" do
  version "0.27.1,1572"
  sha256 "81692bff6dbd51437cc58bd48c7c0eb6f70a94b2ad330996b3b66d2ffd6990fd"

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
