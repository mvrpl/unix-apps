cask 'dockit' do
    version "1.4.5"
    sha256 "4e038f959bcbe756e1b0e5be63c947335d37b80ab91a81a56c747ef494cb92f2"

    url "https://github.com/geek-fun/dockit/releases/download/v1.4.5/DocKit_1.4.5_universal.dmg"
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
