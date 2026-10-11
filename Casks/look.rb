cask "look" do
  version "0.8.1"

  on_arm do
    sha256 "d4b3771e07ee30f1b2a7cb7c6b93c3028a07bda8c772a373383ce13a16b8f1d6"
    url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
  end
  on_intel do
    sha256 "cddc5b9a36942649edbf1a6660d8a02b813f5ddce029176a442830df052db34b"
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
