cask 'dockit' do
    version "0.6.8"
    sha256 "a220f814d30975b51bc263812ba569362e6aa26b167334dfbfdf2a7c0a108318"

    url "https://github.com/geek-fun/dockit/releases/download/v0.6.8/DocKit_0.6.8_universal.dmg"
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
