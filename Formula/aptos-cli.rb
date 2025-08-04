class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.7.0"
  license "Apache-2.0"

  livecheck do
    url 'https://api.github.com/repos/aptos-labs/aptos-core/releases'
    regex(/^aptos-cli-v([\d\.]+)$/i)
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.7.0/aptos-cli-7.7.0-Linux-aarch64.zip"
      sha256 "56fc55c0a5bce752e14812765e0e7a40aecd672ecee9de8772b21a4a854a43e2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.7.0/aptos-cli-7.7.0-Linux-x86_64.zip"
      sha256 "463aa70d89450fe5aa70e7b2296d5f3519094d4b1062433239b82e4db757875d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.7.0/aptos-cli-7.7.0-macOS-arm64.zip"
      sha256 "9440132502a67849ed4ba2132311dc787f275c7feca8a022691a1f72dd3f259d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.7.0/aptos-cli-7.7.0-macOS-x86_64.zip"
      sha256 "7037f4672489760980d198dcb04f0bc04d5c99f89f9d6e7c9faa50c1eeef8cea"
    end
  end

  def install
    bin.install "aptos"
  end
end
