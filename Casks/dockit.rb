cask 'dockit' do
    version "2.0.2"
    sha256 "3fbd4c33079e39f33eb337869153207ff37a18e6c005afe4be0be91cb5fab016"

    url "https://github.com/geek-fun/dockit/releases/download/v2.0.2/DocKit_2.0.2_universal.dmg"
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
