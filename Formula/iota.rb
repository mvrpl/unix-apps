class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.12.0"
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
      url "https://github.com/iotaledger/iota/releases/download/v1.12.0/iota-v1.12.0-linux-arm64.tgz"
      sha256 "e42aa2b565670983dbed1780b799bbd954d34eb677e38f21d9b08b5cbc8f64b2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.12.0/iota-v1.12.0-linux-x86_64.tgz"
      sha256 "829dbdec18d98686dee5990a06f9c943945f88ccea1f3ce73299c35bfc570830"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.12.0/iota-v1.12.0-macos-arm64.tgz"
      sha256 "0b0468e213b99cb0917a1bd5bab09882b4964757f98776384bfca94ade8d557a"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
