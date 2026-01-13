cask 'dockit' do
    version "0.8.0"
    sha256 "f592e33daadbbf45b362fb8c582f5548c042d7a2889877e42c5fe3f90c87b188"

    url "https://github.com/geek-fun/dockit/releases/download/v0.8.0/DocKit_0.8.0_universal.dmg"
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
