class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.15.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.15.0/iota-v1.15.0-linux-arm64.tgz"
      sha256 "3c459ecf60069fdb4c8a683e3b042b0396d207cd4fdd843317e00f7bc2ae5039"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.15.0/iota-v1.15.0-linux-x86_64.tgz"
      sha256 "351ee1b49a0e50b6ab5e02ba62732ee5c940eaa48fdb04e0b6269eede51deaef"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.15.0/iota-v1.15.0-macos-arm64.tgz"
      sha256 "b870ac234c2140c83947cdba13d462f1f7cb8a9dd28c1d1b862234f69361ace4"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
