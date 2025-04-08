cask 'desktop-chsht' do
  version "0.1.0"
  sha256 "1100a623ba43d422e4734ecdf56cee94bc436143325abd7a095e217202687029"

  url "https://github.com/mvrpl/Desktop-Cheat-Sheet/releases/download/v0.1.0/Desktop-Cheat-Sheet.app.zip"
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
