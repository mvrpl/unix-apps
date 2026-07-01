class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.26.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.26.1/iota-v1.26.1-linux-arm64.tgz"
      sha256 "959a54608a2c9b22651234bb7c87419d8b7ce0666639b92dffa388e0e297578f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.26.1/iota-v1.26.1-linux-x86_64.tgz"
      sha256 "09063f2cf75cf8652cfe9810478493b43c25d76b9b1c27e2fe72ee07ba2e85c3"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.26.1/iota-v1.26.1-macos-arm64.tgz"
      sha256 "660253007f4849f16ce5a0f202f726b87ffeb6bb1a3735bd713aba66f6a23758"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
