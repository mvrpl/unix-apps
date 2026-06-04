cask 'dockit' do
    version "1.1.0"
    sha256 "512cf7c2f3b38ba93d8bf10208deb914fc7be83029459e449bbaae267a51e191"

    url "https://github.com/geek-fun/dockit/releases/download/v1.1.0/DocKit_1.1.0_universal.dmg"
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
