cask "amethyst" do
  version "0.25.5,1530"
  sha256 "41e637db3e980585929371879a19b54487095051a7a7d0d9f20d465df54d106c"

  url "https://github.com/mgabs/Amethyst/releases/download/v#{version.csv.first}/Amethyst-v#{version.csv.first}-b#{version.csv.second}.zip"
  name "Amethyst"
  desc "Automatic tiling window manager similar to xmonad (mgabs fork)"
  homepage "https://github.com/mgabs/Amethyst"

  livecheck do
    url "https://raw.githubusercontent.com/mgabs/Amethyst/master/build/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :big_sur

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
