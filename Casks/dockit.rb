cask 'dockit' do
    version "0.9.1"
    sha256 "f94aa62cc41bc8d5a2186d59a9a40401f883e2b74a97554f3f9dc4d1aa76cd19"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.1/DocKit_0.9.1_universal.dmg"
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
