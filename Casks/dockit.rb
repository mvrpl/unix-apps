cask 'dockit' do
    version "0.6.3"
    sha256 "7faa0f72abff15592a8a233378b80100ea55153b06f0ff1dbf3b8e3a4ac63a00"

    url "https://github.com/geek-fun/dockit/releases/download/v0.6.3/DocKit_0.6.3_universal.dmg"
    name "DocKit"
    homepage "https://github.com/geek-fun/dockit"
    desc "NoSQL/NewSQL GUI client"

    auto_updates false
    depends_on macos: ">= :monterey"

    app "DocKit.app"

    livecheck do
        url :homepage
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end
end
