cask 'dockit' do
    version "0.6.7"
    sha256 "d459336c6464c2075c712377489e7e18a8d91959b02f0c23f21c3a7119b16b30"

    url "https://github.com/geek-fun/dockit/releases/download/v0.6.7/DocKit_0.6.7_universal.dmg"
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
