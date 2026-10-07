class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.33.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.33.1/iota-v1.33.1-linux-arm64.tgz"
      sha256 "7d7c08a1a2f8e47c2285c2dca2715ae1f673add92967e307f986e267eb9d54f2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.33.1/iota-v1.33.1-linux-x86_64.tgz"
      sha256 "1d397192a673f7df5d7cc5dd57e15319ccc3fa473a9c81d5161c06c5f9a9e20c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.33.1/iota-v1.33.1-macos-arm64.tgz"
      sha256 "4872f4b9290667db61233ec14a1d2ea3dff676c39e305f3e70ad1e2c8d4da3cc"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
