class Iota < Formula
  desc "Bringing the real world to Web3 with a scalable, decentralized and programmable DLT infrastructure"
  homepage "https://github.com/iotaledger/iota"
  version "1.6.1"
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

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.6.1/iota-v1.6.1-linux-arm64.tgz"
      sha256 "03f6e308c06dd0411e34049e0f5f502a76e3e0fff2153f82671dcd60d2b0609e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.6.1/iota-v1.6.1-linux-x86_64.tgz"
      sha256 "af53e9ddd4964a937c9836a7baab215b9bfb71585e8b50160dd977df775a2732"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iotaledger/iota/releases/download/v1.6.1/iota-v1.6.1-macos-arm64.tgz"
      sha256 "cef7d556e97f8955e7ffc1ef5c8861b1d12f85d707e8f833fee98ba2875ec95f"
    end
  end

  def install
    bin.install "aptos"
  end
end
