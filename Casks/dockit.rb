cask 'dockit' do
    version "0.6.5"
    sha256 "4691c6e19e97b8da42d1bfdb050b80e944db4597f5af470d0715f884e71676c9"

    url "https://github.com/geek-fun/dockit/releases/download/v0.6.5/DocKit_0.6.5_universal.dmg"
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
