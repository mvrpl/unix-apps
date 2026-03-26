class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.1.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.1.0/aptos-cli-9.1.0-Linux-aarch64.zip"
      sha256 "2fae0588e63e86853bf69d6cd38c604ccf26b1321af2929287e5140bab09cd42"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.1.0/aptos-cli-9.1.0-Linux-x86_64.zip"
      sha256 "594a9086126d60ec5ee2d74a0ebab8b81a2f91488f9508bf48f22d91026ae2ea"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.1.0/aptos-cli-9.1.0-macOS-arm64.zip"
      sha256 "49a2cb2eebff9044f4674102f3cbe5b6d2c436e2eecf12609485f98190c5588e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.1.0/aptos-cli-9.1.0-macOS-x86_64.zip"
      sha256 "277fc56f7a8251be6f84f4a2c90f2c19dc456f34d44042401e9bed5acfef2bcf"
    end
  end

  def install
    bin.install "aptos"
  end
end
