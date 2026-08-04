cask 'dockit' do
    version "1.4.0"
    sha256 "41f2321c2a9038633a891e634fcbeed036050b8d21081de96930b950f2530696"

    url "https://github.com/geek-fun/dockit/releases/download/v1.4.0/DocKit_1.4.0_universal.dmg"
    name "DocKit"
    homepage "https://dockit.geekfun.club"
    desc "NoSQL/NewSQL GUI client"

    auto_updates false
    depends_on macos: ">= :monterey"

    app "DocKit.app"

    livecheck do
        url 'https://github.com/geek-fun/dockit'
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end
end
