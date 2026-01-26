cask 'dockit' do
    version "0.8.2"
    sha256 "6cc0e51dec9785316d73565759219d2849340f999c15f0818fb26cc57ae9ce69"

    url "https://github.com/geek-fun/dockit/releases/download/v0.8.2/DocKit_0.8.2_universal.dmg"
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
