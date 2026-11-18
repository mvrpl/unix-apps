class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.36.2"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.36.2/iota-v1.36.2-linux-arm64.tgz"
      sha256 "a7954e419e9bd7b6dcdd2c11d7e0191e2b8fcf77933b80bb1a4df0c52faf1739"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.36.2/iota-v1.36.2-linux-x86_64.tgz"
      sha256 "7432a45410707e0c31a0a2791f9c5ce80473cb4cfbc076d32d4e426cfced0460"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.36.2/iota-v1.36.2-macos-arm64.tgz"
      sha256 "d0aca770400b8da8b7daf0d8d01d843e7c933da9b40ae6657b5fe43f61568eb5"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
