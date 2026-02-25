class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.17.2"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.17.2/iota-v1.17.2-linux-arm64.tgz"
      sha256 "4e21c5ca2dcbb8a386193ab194fd99854cc9ddc84b772b06e2f1d481f98b84f2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.17.2/iota-v1.17.2-linux-x86_64.tgz"
      sha256 "d18f837029d96d9d05ae35a70e00dd9cf4f485d3ba887d83d584265b2c30c5ee"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.17.2/iota-v1.17.2-macos-arm64.tgz"
      sha256 "58d260d402a5fbb86ee9ae960959958ea0de2ef37cd12804395622f8298caea1"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
