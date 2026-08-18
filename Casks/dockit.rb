cask 'dockit' do
    version "1.4.2"
    sha256 "da8d81a9fa38e4ec8a13a6653efd0f7bc0ff4110a0cb50dfaaead12ad4973a20"

    url "https://github.com/geek-fun/dockit/releases/download/v1.4.2/DocKit_1.4.2_universal.dmg"
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
