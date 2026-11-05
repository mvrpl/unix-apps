class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.35.2"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.35.2/iota-v1.35.2-linux-arm64.tgz"
      sha256 "1c23305a4e5cba888fef698370512a68e5d4e4e58d98deb78afdf9d8d0db4bb3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.35.2/iota-v1.35.2-linux-x86_64.tgz"
      sha256 "3c352b4d5058038a2fd87ba1335e5444972587233987a0ed937ca30327d72cbb"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.35.2/iota-v1.35.2-macos-arm64.tgz"
      sha256 "42a00cb9c82bbcff4524d9af7e312675d5f5753d9008e2602829379b6ce3962b"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
