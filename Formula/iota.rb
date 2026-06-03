class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.24.0"
  license "Apache-2.0"

  livecheck do
    url 'https://api.github.com/repos/iotaledger/iota/releases'
    regex(/^v([\d\.]+)$/i)
    strategy :json do |json, regex|
      json.map do |release|
        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on "postgresql"
  depends_on "libpq"

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.24.0/iota-v1.24.0-linux-arm64.tgz"
      sha256 "4a6ffee0dc34e6c33bf6ebd4708f9edd2d887f590b02c9db13d5e96a4139c1cc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.24.0/iota-v1.24.0-linux-x86_64.tgz"
      sha256 "5c47f269c84ce79976e04ffc5bc09fcb53731663e7e31323360a2e585798f339"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.24.0/iota-v1.24.0-macos-arm64.tgz"
      sha256 "b1447ad1c0f02a5dfb52ecdef21fbcdfc61d92e5f26ddd4ded2b7237ba3db848"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
