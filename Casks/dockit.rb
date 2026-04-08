cask 'dockit' do
    version "0.9.3"
    sha256 "c94bd29620b0a86f33b34f2ec48397be24634a58555afe784758dd89130b1bb3"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.3/DocKit_0.9.3_universal.dmg"
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
