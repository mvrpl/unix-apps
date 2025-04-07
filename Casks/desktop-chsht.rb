cask 'desktop-chsht' do
  version "0.0.2"
  sha256 "6f46efcfc31c6378083b14c41d29d27d63ec24c2d85c5243386ebb25a37bc840"

  url "https://github.com/mvrpl/Desktop-Cheat-Sheet/releases/download/v0.0.2/Desktop-Cheat-Sheet.app.zip"
  name "Desktop Cheat Sheet"
  homepage "https://github.com/mvrpl/Desktop-Cheat-Sheet"
  desc "Cheat Sheets GUI client"

  auto_updates false
  depends_on macos: ">= :monterey"
  depends_on formula: "chsht"

  app "Desktop-Cheat-Sheet.app"

  livecheck do
      url :homepage
      regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
      strategy :github_latest
  end
end
