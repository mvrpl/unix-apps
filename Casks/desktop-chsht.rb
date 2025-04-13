cask 'desktop-chsht' do
  version "0.2.2"
  sha256 "b76692745a5d5636103b7bcebbbdf03b01ac7c142ac4093820fe3aaa40bc943b"

  url "https://github.com/mvrpl/Desktop-Cheat-Sheet/releases/download/v0.2.2/Desktop-Cheat-Sheet.app.zip"
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
