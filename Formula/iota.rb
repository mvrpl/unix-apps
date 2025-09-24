class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.7.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.7.0/iota-v1.7.0-linux-arm64.tgz"
      sha256 "244fb220e8cd654b8db181794fb5c56931f0a5c18f8216bbe232fc20711c63cc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.7.0/iota-v1.7.0-linux-x86_64.tgz"
      sha256 "2e6e6617a8dfd71c4bea29932581f131de464b87f5809dbc3e78fdf8cad61ed6"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.7.0/iota-v1.7.0-macos-arm64.tgz"
      sha256 "c5b7e68b37598d96d611f5eb2d09584d7eefe668761cfd23642185c30b421916"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
