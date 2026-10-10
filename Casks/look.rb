cask "look" do
  arch arm: "", intel: "-x86_64"

  version "0.7.5"
  sha256 arm:   "0a85dc3a8ca8742c7f28b9f12c9e2128fddb7bc64a7168afbf00f2310ec5df6a",
         intel: "1d396ef7cdd8bf20cc41116e61538910f689439dcf6e9f826cc66a9319b1a891"

  url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS#{arch}.zip"
  name "Look"
  desc "Keyboard-first, local-first launcher"
  homepage "https://github.com/mgabs/look"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Look.app"
  binary "#{appdir}/Look.app/Contents/MacOS/Look", target: "lookapp"

  zap trash: [
    "~/.look",
    "~/Library/Application Support/noah-code.Look",
    "~/Library/Caches/noah-code.Look",
    "~/Library/Preferences/noah-code.Look.plist",
    "~/Library/Saved Application State/noah-code.Look.savedState",
  ]

  caveats <<~EOS
    If macOS blocks launch with a malware warning or error -128, run:
      xattr -dr com.apple.quarantine /Applications/Look.app
  EOS
end
