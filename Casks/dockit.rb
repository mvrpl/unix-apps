cask 'dockit' do
    version "0.9.8"
    sha256 "ac310d9be55b60cbaff7d231a5f999d8e95b02bd17e66b8e4dc0f88b3c94107f"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.8/DocKit_0.9.8_universal.dmg"
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
