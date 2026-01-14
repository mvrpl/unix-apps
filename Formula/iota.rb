class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.14.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.14.1/iota-v1.14.1-linux-arm64.tgz"
      sha256 "d4763e3d8cfccfb7224581825b3e8ecf63e2368459eb58588a4fcd7f5ae7f638"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.14.1/iota-v1.14.1-linux-x86_64.tgz"
      sha256 "2a1a23cc62085ff0f81eda271ff837c60ff0f980dec5554235fe8adb0f374f8f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.14.1/iota-v1.14.1-macos-arm64.tgz"
      sha256 "9b0944d58d3ba47a52cb80b71b275880011a65afcb40de5a49587d39899f2d30"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
