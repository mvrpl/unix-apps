cask 'dockit' do
    version "1.4.4"
    sha256 "dda74f13b2a04c23054c25ad7c4d583305e1e9beb719db7868c21b573f88b00c"

    url "https://github.com/geek-fun/dockit/releases/download/v1.4.4/DocKit_1.4.4_universal.dmg"
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
