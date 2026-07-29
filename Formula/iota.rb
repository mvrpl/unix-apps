class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.28.3"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.28.3/iota-v1.28.3-linux-arm64.tgz"
      sha256 "9db140343b3df60a2e9d55c408bb7ae77e18e8bd9fbd5ac64ef1eb6d554d1fa8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.28.3/iota-v1.28.3-linux-x86_64.tgz"
      sha256 "091887df12a6c999d154bf2df8ccafe3481d7ac7c1b48d82da6aff6bdd56bad1"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.28.3/iota-v1.28.3-macos-arm64.tgz"
      sha256 "6eefb3c4da4b69abca488b7485abdbbc294b66534eeaf3ca35fcae7738ac6c3f"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
