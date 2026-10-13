cask "look" do
  version "0.8.5"

  on_arm do
    sha256 "28efa97ce55f27ff7d249d91f8b55370a58f4020908e32849b10f5240fec975b"
    url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
  end
  on_intel do
    sha256 "9480815991ff88a57ec8a2827d2ec6341915815619d264d8a9efa4dc09a1849a"
    url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS-x86_64.zip"
  end

  name "Look"
  desc "Keyboard-first local launcher"
  homepage "https://github.com/mgabs/look"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Look.app"
  binary "#{appdir}/Look.app/Contents/MacOS/Look", target: "lookapp"

  uninstall quit: "noah-code.Look"

  zap trash: [
    "~/.look",
    "~/Library/Application Support/Look",
    "~/Library/Caches/noah-code.Look",
    "~/Library/HTTPStorages/noah-code.Look",
    "~/Library/HTTPStorages/noah-code.Look.binarycookies",
    "~/Library/Preferences/noah-code.Look.plist",
  ]
end
