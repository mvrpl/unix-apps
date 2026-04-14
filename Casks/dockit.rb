cask 'dockit' do
    version "0.9.5"
    sha256 "2bdc039a900f8b36b24627c9f4b99952f4af48538e3d45a027c8d2b32fff79b3"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.5/DocKit_0.9.5_universal.dmg"
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
