cask 'dockit' do
    version "0.7.0"
    sha256 "8c82e899e4a5e126e882628b606ce3d35c05ebb011f6970f02e198c93a7337a0"

    url "https://github.com/geek-fun/dockit/releases/download/v0.7.0/DocKit_0.7.0_universal.dmg"
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
