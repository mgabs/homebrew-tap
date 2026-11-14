cask "tscribe" do
  version "2.4.1"

  on_arm do
    sha256 "b54f9683d9e6223191e1ece21dc0bc58309122d9b44ee8788f6d85887eca8b84"
    url "https://github.com/mgabs/tscribe/releases/download/v#{version}/tscribe-#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "8f4e5309840b374b697e7b00257444bae75799f120f8be640041305a08adbe72"
    url "https://github.com/mgabs/tscribe/releases/download/v#{version}/tscribe-#{version}-macos-x86_64.zip"
  end

  name "tscribe"
  desc "Local audio recorder and transcriber with faster-whisper"
  homepage "https://github.com/mgabs/tscribe"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "tscribe.app"

  postflight_steps do
    run "xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/tscribe.app"],
        must_succeed: false
  end

  uninstall quit: "com.tscribe.app"

  zap trash: [
    "~/Library/Application Support/tscribe",
    "~/Library/Caches/com.tscribe.app",
    "~/Library/Preferences/com.tscribe.app.plist",
    "~/Library/Saved Application State/com.tscribe.app.savedState",
  ]
end
