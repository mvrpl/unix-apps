cask 'dockit' do
    version "2.0.3"
    sha256 "7d061ba44720c4dfa95a69d63c6338f0ba9272c4f9336f69f1f594adf6ad7943"

    url "https://github.com/geek-fun/dockit/releases/download/v2.0.3/DocKit_2.0.3_universal.dmg"
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
