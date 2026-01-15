cask 'dockit' do
    version "0.8.1"
    sha256 "e688756c8d0947c69b143c562b2a6f6b0fab5dfd60ed8067de9d579f37597181"

    url "https://github.com/geek-fun/dockit/releases/download/v0.8.1/DocKit_0.8.1_universal.dmg"
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
