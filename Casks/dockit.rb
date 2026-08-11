cask 'dockit' do
    version "1.4.1"
    sha256 "1590dd9430f598d9409cc8df738a53a88569902c9a8be2cc806f5081fc43d1fc"

    url "https://github.com/geek-fun/dockit/releases/download/v1.4.1/DocKit_1.4.1_universal.dmg"
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
