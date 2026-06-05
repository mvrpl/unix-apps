cask 'dockit' do
    version "1.1.1"
    sha256 "87b90bae9db0f67ca063b43b21418ebaf8c25688294377edf1a3a9f4c52407c2"

    url "https://github.com/geek-fun/dockit/releases/download/v1.1.1/DocKit_1.1.1_universal.dmg"
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
