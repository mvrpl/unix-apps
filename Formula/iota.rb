class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.11.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.11.0/iota-v1.11.0-linux-arm64.tgz"
      sha256 "8e0491291a3a521e7c31e85423dbc1be5c2f496dc68d854e9293fd0d32a2fa30"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.11.0/iota-v1.11.0-linux-x86_64.tgz"
      sha256 "4193caeea4f8ff9d593570574116393dfeb69ba4683b0db76831e09adac5a1bf"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.11.0/iota-v1.11.0-macos-arm64.tgz"
      sha256 "680c14b9457161b6c35ec3583c9f7d608a01491e32ddea152389c36306cf7ffc"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
