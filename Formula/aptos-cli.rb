class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.8.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.0/aptos-cli-7.8.0-Linux-aarch64.zip"
      sha256 "f37d313182f9200d391fa9b9480f945ceff5766212f2b1a8660582a9b89cf6f3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.0/aptos-cli-7.8.0-Linux-x86_64.zip"
      sha256 "707d5f6f41fb29ee000391cd89a98124d013786a2807403cc320b6a1ac610270"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.0/aptos-cli-7.8.0-macOS-arm64.zip"
      sha256 "b47d529f044a2517e0ec85e3b8d081e2aac9f722bb73ac6abf343e4ddb140a1b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.0/aptos-cli-7.8.0-macOS-x86_64.zip"
      sha256 "2caba48bb27b22a215895a5387c79498ccb3e56565485c5c7874be2892cbd9f1"
    end
  end

  def install
    bin.install "aptos"
  end
end
