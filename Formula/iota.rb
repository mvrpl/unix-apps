class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.23.2"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.23.2/iota-v1.23.2-linux-arm64.tgz"
      sha256 "7492600e9a163648f7ee88d92f68c992e404e2039ff85e52871c5e7340846a16"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.23.2/iota-v1.23.2-linux-x86_64.tgz"
      sha256 "c018af8f0f6f016166d02511bda28fb63fe56146a0bb97b0a7d510924c34245f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.23.2/iota-v1.23.2-macos-arm64.tgz"
      sha256 "d1ff2899c14c3e2a17278d527f354a9bca3a148e1e1f08579a6500cef3905cf8"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
