class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.27.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.27.0/iota-v1.27.0-linux-arm64.tgz"
      sha256 "99548e653bb029094615d3f4da209a492b70d9a5dadbd2856a215b189101569f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.27.0/iota-v1.27.0-linux-x86_64.tgz"
      sha256 "ea9ed932c8f7980bd981c83dd978b654bfd5142844580e394feb49ff59cdb9d4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.27.0/iota-v1.27.0-macos-arm64.tgz"
      sha256 "781bb09e15c57660527eb58135e0807b8593767aea19056c976a79148a9da16d"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
