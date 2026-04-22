class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.21.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.21.1/iota-v1.21.1-linux-arm64.tgz"
      sha256 "37008094b29fe957609ce4b3e2d0f6f921212a8955278d3d3e7c0b12a4904d59"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.21.1/iota-v1.21.1-linux-x86_64.tgz"
      sha256 "33bbe350a77e570d5b88423bc7c543f473a5459126729b74bf06b69054ae3928"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.21.1/iota-v1.21.1-macos-arm64.tgz"
      sha256 "3ba3ee2a6a39b6cb940d5871c09c63fe8c8393127ad51dc203e6ed3fe24be582"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
