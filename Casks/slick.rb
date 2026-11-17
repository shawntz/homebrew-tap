cask "slick" do
  version "0.1.1"
  sha256 "1a84262a5d13e3155940d6e754038bb900ace1d023eb88a461b141667b5b2837"

  url "https://github.com/shawntz/slick/releases/download/v#{version}/Slick-#{version}.zip"
  name "Slick"
  desc "Keyboard launcher for apps, settings, clipboard history and more"
  homepage "https://slick.computer/"

  # Releases are not pre-releases, so GitHub's latest release is the newest version.
  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself with Sparkle, so brew upgrade leaves it alone unless told --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Slick.app"

  uninstall quit: "com.shawnschwartz.slick"

  zap trash: [
    "~/Library/Application Support/Slick",
    "~/Library/Caches/com.shawnschwartz.slick",
    "~/Library/Preferences/com.shawnschwartz.slick.plist",
    "~/Library/Saved Application State/com.shawnschwartz.slick.savedState",
  ]
end
