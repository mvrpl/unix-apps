class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.8.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.8.0/iota-v1.8.0-linux-arm64.tgz"
      sha256 "893c17928bb2ee3979ce2fd4b1277a8eb7a4664d5e74dbf95038932ac8acd105"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.8.0/iota-v1.8.0-linux-x86_64.tgz"
      sha256 "81763dbeab608a64b4d372682e1f5a4c7f7bf93c7fde844324afcc672958a889"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.8.0/iota-v1.8.0-macos-arm64.tgz"
      sha256 "ca9194ffa1219b6764b650ec31269dde00ce8f3c721f2917da03262738430736"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
