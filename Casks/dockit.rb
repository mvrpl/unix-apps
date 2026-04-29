cask 'dockit' do
    version "0.9.10"
    sha256 "f307044a30677db04d56551bdf0d61df56f04260eb6dddca2763dd2aa83364b2"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.10/DocKit_0.9.10_universal.dmg"
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
