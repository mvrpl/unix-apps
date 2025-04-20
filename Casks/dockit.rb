cask 'dockit' do
    version "0.6.6"
    sha256 "94dab63806271796eeb710b57faeafc0bba991fcbb6bbbec73cdee497226e8e3"

    url "https://github.com/geek-fun/dockit/releases/download/v0.6.6/DocKit_0.6.6_universal.dmg"
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
