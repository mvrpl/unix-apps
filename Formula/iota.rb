class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.31.2"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.31.2/iota-v1.31.2-linux-arm64.tgz"
      sha256 "4f06593e1ab1aac6fd5fa0c39b1b50d2b319a3c449748e644da1f7730be51834"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.31.2/iota-v1.31.2-linux-x86_64.tgz"
      sha256 "1c815fa1de5558400b27177ef848b89a8cff46a6c06f4a6c0028a149aaff2b6e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.31.2/iota-v1.31.2-macos-arm64.tgz"
      sha256 "26bea8d5b5bc8eaf69994e7f4a2bc6594015a96ac0b64bbadbefc160ea483f15"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
