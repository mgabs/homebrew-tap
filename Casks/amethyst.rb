cask "amethyst" do
  version "0.26.0,1558"
  sha256 "d6e82db0641080b6876ffb1245fec0c85a6818dc98629b2d0c074c93a36f49a2"

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

  caveats <<~EOS
    If macOS blocks launch with a malware warning or error -128, run:
      xattr -dr com.apple.quarantine /Applications/Amethyst.app
  EOS
end
