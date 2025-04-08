cask 'desktop-chsht' do
  version "0.2.0"
  sha256 "c3fb5f490c0f437130d5284878cbb07a30797a24c85ec172fa9f9ecab0f66c31"

  url "https://github.com/mvrpl/Desktop-Cheat-Sheet/releases/download/v0.2.0/Desktop-Cheat-Sheet.app.zip"
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
