cask 'dockit' do
    version "0.9.0"
    sha256 "4d2a9fd1f88ca81353949e5cbfa597bc00d548d0edc135e263c461dcf8b018ad"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.0/DocKit_0.9.0_universal.dmg"
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
