class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.10.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.0/aptos-cli-7.10.0-Linux-aarch64.zip"
      sha256 "72d81b72c195439a1c21d63a2cce466f1cf66581cab32fc22be7a3855650b0ca"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.0/aptos-cli-7.10.0-Linux-x86_64.zip"
      sha256 "66db5559ec08386e215474f0fec6a595989fd354d859c2b0afc98e8f6812ab81"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.0/aptos-cli-7.10.0-macOS-arm64.zip"
      sha256 "1d8261d2d41b9907f33af23fd256f87ece0cff7e6d6d938715319d7f74829e60"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.0/aptos-cli-7.10.0-macOS-x86_64.zip"
      sha256 "01f82558b13b97ef5e5e17daf819a91cb99c88d8a7e0d63fd9a4c35544700339"
    end
  end

  def install
    bin.install "aptos"
  end
end
