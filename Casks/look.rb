cask "look" do
  version "0.8.6"

  on_arm do
    sha256 "f7094258f32aea5817455dc3166e8959c17be6dfdee537d2f31dd9893d1d160d"
    url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
  end
  on_intel do
    sha256 "375bfaac8b1c639b344844e57ec70bbe01442e6244d46d1f75b3e70a4c876713"
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
