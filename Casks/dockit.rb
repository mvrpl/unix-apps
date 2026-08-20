cask 'dockit' do
    version "1.4.3"
    sha256 "e12260e4c9cd9f6ba21d802c3bb5f4daabd54def61050a88fd846d2bf6724f3c"

    url "https://github.com/geek-fun/dockit/releases/download/v1.4.3/DocKit_1.4.3_universal.dmg"
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
