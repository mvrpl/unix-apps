cask 'dockit' do
    version "0.6.4"
    sha256 "db5f4d081aac613881a0b8ff410d22b6604733c6d26f5dd358a9ddd2d50cb5c8"

    url "https://github.com/geek-fun/dockit/releases/download/v0.6.4/DocKit_0.6.4_universal.dmg"
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
