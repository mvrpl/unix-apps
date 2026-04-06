cask 'dockit' do
    version "0.9.2"
    sha256 "abd183c8b7bef72653bcd36a37cabc6903a4352a5a6c671691262a86645850af"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.2/DocKit_0.9.2_universal.dmg"
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
