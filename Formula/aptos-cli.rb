class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.6.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.0/aptos-cli-7.6.0-Linux-aarch64.zip"
      sha256 "e7bb119eddfba9b7e2ab1415d2c22e95b41057526e5796e6605dedfe069782aa"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.0/aptos-cli-7.6.0-Linux-x86_64.zip"
      sha256 "093adec36c8b428015a17026b45066d3fec4410720e6ebdb418e03a005a8ab80"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.0/aptos-cli-7.6.0-macOS-arm64.zip"
      sha256 "469d7d9eae02fde9a0d5a5d7d587861179222891e3c82beb180f3a4e62d3ff06"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.0/aptos-cli-7.6.0-macOS-x86_64.zip"
      sha256 "ec296197a591e3200cdebbb6a85303fb321fc198c6c0efd0e95d4c5540aec716"
    end
  end

  def install
    bin.install "aptos"
  end
end
