class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.19.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.19.1/iota-v1.19.1-linux-arm64.tgz"
      sha256 "98e80961fba0e6419a82856577a46ce0dd68754738caa200fc2114e8f1a70de6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.19.1/iota-v1.19.1-linux-x86_64.tgz"
      sha256 "e05f16e801324a0e2ad6c81dc5a8da8fd47ae323c70b84e0d8aba1fec34c55d5"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.19.1/iota-v1.19.1-macos-arm64.tgz"
      sha256 "d1060c655eee5f8405c6b75a165e9db0b37e1051a33cc9e9b114d39edf285245"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
