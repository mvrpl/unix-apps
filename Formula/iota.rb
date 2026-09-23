class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.32.1"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.32.1/iota-v1.32.1-linux-arm64.tgz"
      sha256 "aa36e94f69b9490e50ff735da53f97a0cbe1ae5ff4469cec55fd1fefa8cca8d1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.32.1/iota-v1.32.1-linux-x86_64.tgz"
      sha256 "39261376ed5bab3f660bd91dd5069cd832d4f997da03815e8782f9e31b2dfe0f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.32.1/iota-v1.32.1-macos-arm64.tgz"
      sha256 "81cde56f347fe35991ea8e7c57f2df9c04c6d47353b16c0ed359abf38634fd2f"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
