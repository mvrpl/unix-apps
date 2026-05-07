cask 'dockit' do
    version "1.0.0"
    sha256 "5ffca261f7926130a56d749eb45ae753ee234833e94a7571285790b5f4bbe219"

    url "https://github.com/geek-fun/dockit/releases/download/v1.0.0/DocKit_1.0.0_universal.dmg"
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
