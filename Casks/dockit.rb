cask 'dockit' do
    version "2.0.0"
    sha256 "b0405f8c44088d9aa017eac9f47de6055c9acd542fd48d952cbfe8d0352f4661"

    url "https://github.com/geek-fun/dockit/releases/download/v2.0.0/DocKit_2.0.0_universal.dmg"
    name "DocKit"
    homepage "https://dockit.geekfun.club"
    desc "NoSQL/NewSQL GUI client"

    auto_updates false
    depends_on macos: :monterey

    app "DocKit.app"

    livecheck do
        url 'https://github.com/geek-fun/dockit'
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end
end
