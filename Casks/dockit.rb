cask 'dockit' do
    version "0.9.7"
    sha256 "d4efa2f6794b2de5b01edb175a62449379a839913c28520bd2637ba055ae1037"

    url "https://github.com/geek-fun/dockit/releases/download/v0.9.7/DocKit_0.9.7_universal.dmg"
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
