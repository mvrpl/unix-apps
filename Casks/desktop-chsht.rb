cask 'desktop-chsht' do
  version "0.2.1"
  sha256 "f9c075c34d4e2edb55d4d5efc9b5714e9530761760b16a372595cf457a694c32"

  url "https://github.com/mvrpl/Desktop-Cheat-Sheet/releases/download/v0.2.1/Desktop-Cheat-Sheet.app.zip"
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
