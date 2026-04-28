cask 'dockit' do
    version "0.9.9"
    sha256 "8479effb243a88be1b9481453851446f29876b27cbcb2dc151f6e53c1ceaecbe"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.9/DocKit_0.9.9_universal.dmg"
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
