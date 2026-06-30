cask 'dockit' do
    version "1.2.0"
    sha256 "7e69c4ddbe2c598254a020250bc94c1634f10d22ee4ed9e1e954c1259d06a119"

    url "https://github.com/geek-fun/dockit/releases/download/v1.2.0/DocKit_1.2.0_universal.dmg"
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
