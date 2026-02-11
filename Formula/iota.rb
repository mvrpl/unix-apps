class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.16.2"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.16.2/iota-v1.16.2-linux-arm64.tgz"
      sha256 "3960264543a6d0979c65d030eb9504555664d9132cdac7afefe3e0d57a6b1347"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.16.2/iota-v1.16.2-linux-x86_64.tgz"
      sha256 "0f178f33d40a68df79f06eff7ac1f322607fd4fd5f4f01878c044c36db21fef0"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.16.2/iota-v1.16.2-macos-arm64.tgz"
      sha256 "b65f1523e1da233ce1fce321c6d43a992674357c7478c9b2109cca69661017d6"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
