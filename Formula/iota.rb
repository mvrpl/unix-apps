class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.34.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.34.1/iota-v1.34.1-linux-arm64.tgz"
      sha256 "3750516124fa323fad7c9abe93dc7050c88ff4fa597498b6b55cc8b61b31d0b7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.34.1/iota-v1.34.1-linux-x86_64.tgz"
      sha256 "291c2113e16804bf17647a0947717fe7a1f7a0f46cd652eb24189d9ec714ea53"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.34.1/iota-v1.34.1-macos-arm64.tgz"
      sha256 "b541d0a4667b8db24e7cadb9d03ce1c57ebd8fcf6ddfc8f6dc6b7a352f4568b8"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
