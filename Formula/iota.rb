class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.10.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.10.0/iota-v1.10.0-linux-arm64.tgz"
      sha256 "e24de785e7b7e625cb282db1232ba7d620c6e3efc61110c15e30b5909c964147"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.10.0/iota-v1.10.0-linux-x86_64.tgz"
      sha256 "635a03d6e4e73a5027359d743367d4947c3c4551116b8a97c998395d148f943f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.10.0/iota-v1.10.0-macos-arm64.tgz"
      sha256 "c1e6344e88129a0b8f147a4ca40e1079e958a640b307330167229586aa1effa5"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
