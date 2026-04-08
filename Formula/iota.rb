class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.20.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.20.1/iota-v1.20.1-linux-arm64.tgz"
      sha256 "82003771be8ddd1c0fc9aa02e523ee8c4fadf196c017b007762784672fee2f53"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.20.1/iota-v1.20.1-linux-x86_64.tgz"
      sha256 "57ae6019e68cb35eeb0f7434af281d1a7bd15d3d35901a94b17e8af20e30e53f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.20.1/iota-v1.20.1-macos-arm64.tgz"
      sha256 "e851cf6d850042c0bce57cfda35f71553c6959e4016d701a6a1a935565e2f7b8"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
