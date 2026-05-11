cask 'dockit' do
    version "1.0.1"
    sha256 "e8628dc73591e7f9c2f4d0932bc3bc122f7c02b40146417491de63a1d06adf91"

    url "https://github.com/geek-fun/dockit/releases/download/v1.0.1/DocKit_1.0.1_universal.dmg"
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
