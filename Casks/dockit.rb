cask 'dockit' do
    version "1.3.1"
    sha256 "19fbc4b1f0214f9bc9b882d5a643fc0f359ef14c25949dbfe3690271c6c3e868"

    url "https://github.com/geek-fun/dockit/releases/download/v1.3.1/DocKit_1.3.1_universal.dmg"
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
