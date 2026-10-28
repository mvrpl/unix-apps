cask 'dockit' do
    version "2.0.1"
    sha256 "b4c0c2a147a2985e16d54caea428c6e8b5a46085c9f306aa5b1a31d49a700faa"

    url "https://github.com/geek-fun/dockit/releases/download/v2.0.1/DocKit_2.0.1_universal.dmg"
    name "DocKit"
    homepage "https://dockit.geekfun.club"
    desc "NoSQL/NewSQL GUI client"

    auto_updates false
    depends_on macos: :monterey

    app "DocKit.app"

    livecheck do
        url 'https://github.com/geek-fun/dockit'
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end
end
