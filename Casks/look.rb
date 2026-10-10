cask "look" do
  arch arm: "", intel: "-x86_64"

  version "0.7.7"
  sha256 arm:   "6723898ab536ea8e99adbcdaab40cd611de5a77ab832328623554846418a28b8",
         intel: "be2030c3edf6d0786d2f651a2f5979f1959053faf35a647d4e1da75601d5089c"

  url "https://github.com/mgabs/look/releases/download/v#{version}/Look-#{version}-macOS#{arch}.zip"
  name "Look"
  desc "Keyboard-first, local-first launcher"
  homepage "https://github.com/mgabs/look"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

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
