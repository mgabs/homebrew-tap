cask "look" do
  version "0.9.0"

  on_arm do
    sha256 "8dded9a2f3a0abe724c52c9049715b9a1a2856f415da70f921684e29e2c3712b"
    url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
  end
  on_intel do
    sha256 "217539c7e8cde9d55e415e54d3a94a83aae5cacf85ad2592cf45399b8bd03d84"
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
