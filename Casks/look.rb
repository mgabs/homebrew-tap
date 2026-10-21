cask "look" do
  version "0.12.0"

  on_arm do
    sha256 "4b9fdc0472edbc9269f3a2a4be4edb5083851b59cbbd76427f1b3e707168c1b0"
    url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS.zip"
  end
  on_intel do
    sha256 "f2be9d33ab1a5ce816d28992aa09889a746c2ba2696424583038e0c16e35944f"
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

  postflight do
    system_command "xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Look.app"],
                   must_succeed: false
  end

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
