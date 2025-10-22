class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.9.2"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.9.2/iota-v1.9.2-linux-arm64.tgz"
      sha256 "e20ca4ab200948aba0b94ecf5eeb3430a5b57c7d73b46a042e794bbd23f9d9ba"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.9.2/iota-v1.9.2-linux-x86_64.tgz"
      sha256 "b40673e0fbf0e40aa0c2f3e6e1665cd9abbdcb73d0071f46d1b121c348934931"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.9.2/iota-v1.9.2-macos-arm64.tgz"
      sha256 "5806f690b5790f1ade54004733e2d14720b8d392220738f9ed090257ea7369e1"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
