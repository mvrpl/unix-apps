cask 'desktop-chsht' do
  version "0.0.1"
  sha256 "7972cc66aade40201e5ab95cf1cf09b7342609ebd43ec8a9682d269ea06fc446"

  url "https://github.com/mvrpl/Desktop-Cheat-Sheet/releases/download/v0.0.1/Desktop-Cheat-Sheet.app.zip"
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
