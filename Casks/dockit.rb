cask 'dockit' do
    version "1.3.0"
    sha256 "50b18ece1d86c08671df7308b566d61441baa2a891b1cd63852139765a8354a7"

    url "https://github.com/geek-fun/dockit/releases/download/v1.3.0/DocKit_1.3.0_universal.dmg"
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
