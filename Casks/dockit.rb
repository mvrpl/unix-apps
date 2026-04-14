cask 'dockit' do
    version "0.9.6"
    sha256 "e2b65760d23ebdb0266662b539e7c403dab6f7af988e7bb386c9ce3b2019d13b"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.6/DocKit_0.9.6_universal.dmg"
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
