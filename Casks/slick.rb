cask "slick" do
  version "0.1.0"
  sha256 "a1a6f1b3553142666c7dbd3a7da2aaa1410ee46c63fc429f1c53657f06f4c8e5"

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
