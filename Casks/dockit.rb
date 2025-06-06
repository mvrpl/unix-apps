cask 'dockit' do
    version "0.6.9"
    sha256 "37fd8cded243466602f1372a0ecf23718edb475b43ad3ea72f252b8191aa9d27"

    url "https://github.com/geek-fun/dockit/releases/download/v0.6.9/DocKit_0.6.9_universal.dmg"
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
