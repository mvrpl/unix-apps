class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.29.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.29.0/iota-v1.29.0-linux-arm64.tgz"
      sha256 "0d969ce78de2afa73b70ac9a639a579673627b0ae31b26cab6dd7dc6d4870f64"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.29.0/iota-v1.29.0-linux-x86_64.tgz"
      sha256 "027071c81498e928e173cfc5ce6b7590289b54f85669b9da456a375b51cbc719"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.29.0/iota-v1.29.0-macos-arm64.tgz"
      sha256 "230302e91a1b1495cd52f2f80b1f53602642d567082b40b55e2a985671b26b7b"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
