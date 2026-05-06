class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.22.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.22.1/iota-v1.22.1-linux-arm64.tgz"
      sha256 "66673b9f86f60d2300d9c51117ce183fdf661ff5136102cce825e47d1c5b85a3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.22.1/iota-v1.22.1-linux-x86_64.tgz"
      sha256 "7612fb8b929aaa7711e8d900c686f0aac07c78184a0dd878804aee75db625099"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.22.1/iota-v1.22.1-macos-arm64.tgz"
      sha256 "ab5a865caa50f2766d7f7fbe1d6535ed04bf668bfc117cd4b3917f8eb1cbca21"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
