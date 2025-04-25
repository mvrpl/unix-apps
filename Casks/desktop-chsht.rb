cask 'desktop-chsht' do
  version "0.2.3"
  sha256 "3a5dfd4fa1ad78738655e6c79a75b8a58c469dd0dc5b26cb293fae6450ecefe8"

  url "https://github.com/mvrpl/Desktop-Cheat-Sheet/releases/download/v0.2.3/Desktop-Cheat-Sheet.app.zip"
  name "Desktop Cheat Sheet"
  homepage "https://github.com/mvrpl/Desktop-Cheat-Sheet"
  desc "Cheat Sheets GUI client"

  auto_updates false
  depends_on macos: ">= :monterey"
  depends_on formula: "chsht"

  app "Desktop-Cheat-Sheet.app", target: "Desktop Cheat Sheet.app"

  livecheck do
      url :homepage
      regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
      strategy :github_latest
  end
end
