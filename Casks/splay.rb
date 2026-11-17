cask "splay" do
  version "0.6"
  sha256 "4870162f872c12b0cf03f925525fe16e654324044e288c72df5662e1b3f8d449"

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
