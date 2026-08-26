class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.30.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.30.1/iota-v1.30.1-linux-arm64.tgz"
      sha256 "a270ba2642b063f79766fd30ced7dd4a4e7080b2d7647670b3073bf77fd1beec"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.30.1/iota-v1.30.1-linux-x86_64.tgz"
      sha256 "196d60784d90bb0fe7aee02a6e07db6e29d0397cc69bb576ab5894d2a9924976"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.30.1/iota-v1.30.1-macos-arm64.tgz"
      sha256 "0fbb1e1e408db2784116fadc9958cb583303a40878b2e9159da5316b234c863e"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
