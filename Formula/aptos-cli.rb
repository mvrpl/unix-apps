class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.5.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.5.0/aptos-cli-7.5.0-Linux-aarch64.zip"
      sha256 "c5516485db0fb84a5e433dadcd15420d3eff5ab14cac87cb9e0fd4102c764aa9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.5.0/aptos-cli-7.5.0-Linux-x86_64.zip"
      sha256 "60f949b37a6caa655ef2077645c07b324787f070ab6b79157beb09306244ecee"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.5.0/aptos-cli-7.5.0-macOS-arm64.zip"
      sha256 "57a90d2ea4a39a4350e667af2fd505fe2549dbe927611ce27b6acd3a18c6dbe7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.5.0/aptos-cli-7.5.0-macOS-x86_64.zip"
      sha256 "10a849145a492d8c13824682625b25838ca656c9a1b71ed40eac494c22bb6737"
    end
  end

  def install
    bin.install "aptos"
  end
end
