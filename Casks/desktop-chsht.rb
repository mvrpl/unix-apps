cask 'desktop-chsht' do
  version "0.2.1"
  sha256 "267fc000141eb0f73433a17d8fca5710a02d32eed54198644d71703c809e57f7"

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
