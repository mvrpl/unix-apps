cask 'dockit' do
    version "2.0.4"
    sha256 "c62a90010b062da809c19825578b5c78ebc5b07d0333163360f12ad3bd5fe873"

    url "https://github.com/geek-fun/dockit/releases/download/v2.0.4/DocKit_2.0.4_universal.dmg"
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
