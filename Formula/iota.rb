class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.25.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.25.0/iota-v1.25.0-linux-arm64.tgz"
      sha256 "78b47fb2cf6868fbebb79b86b80f75ec7196cd17cf3005c174ac769042de4fa8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.25.0/iota-v1.25.0-linux-x86_64.tgz"
      sha256 "399c9eda8cccdf95de6c98430e1719c2da2a87b48ccf6e7347b6270bf36a6b74"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.25.0/iota-v1.25.0-macos-arm64.tgz"
      sha256 "304bc49b69ee0d40458d176779ddc187e8c24850fa63dff2c64a5829fd03363d"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
