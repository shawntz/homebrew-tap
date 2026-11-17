cask "splay" do
  version "0.4"
  sha256 "a88b106c0ba88a811a962aae5cff5a7f31580cc4a86f73cd5466a4ba912f6611"

  url "https://github.com/shawntz/splay/releases/download/v#{version}/Splay.app.zip"
  name "Splay"
  desc "Scrolling tiling window manager with one row of windows per Space"
  homepage "https://shawntz.github.io/splay/"

  livecheck do
    url "https://github.com/shawntz/splay/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Splay.app"
  binary "#{appdir}/Splay.app/Contents/MacOS/splay"

  uninstall quit: "com.shawnschwartz.splay"

  zap trash: [
    "~/.config/splay",
    "~/Library/Application Support/splay",
    "~/Library/Caches/com.shawnschwartz.splay",
    "~/Library/Logs/splay.log",
    "~/Library/Preferences/com.shawnschwartz.splay.plist",
  ]
end
