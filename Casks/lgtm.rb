cask "lgtm" do
  version "0.3.0"
  sha256 "aa4a322bb37a8cc1cd23ca67fac18ce99212848634cbdedc9cec328a86610457"

  url "https://github.com/mgabs/lgtm/releases/download/v#{version}/lgtm-v#{version}-darwin-arm64.tar.gz"
  name "lgtm"
  desc "Fast, real-time terminal diff reviewer & AI agent steering TUI built in Rust"
  homepage "https://github.com/mgabs/lgtm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  binary "lgtm"

  zap trash: [
    "~/.config/lgtm",
  ]
end
