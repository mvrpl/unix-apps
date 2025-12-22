class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.12.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.1/aptos-cli-7.12.1-Linux-aarch64.zip"
      sha256 "2f9d594f1b68d12a6ee3ee78d44f4233554d840a8e5e7f4029b227fbfe0c712f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.1/aptos-cli-7.12.1-Linux-x86_64.zip"
      sha256 "76d3f5524200ff1259dcaf3b4eeb053ac7e1c7af9fa95a2117149428786106d6"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.1/aptos-cli-7.12.1-macOS-arm64.zip"
      sha256 "4a2c4c5ecef87b871a684f6b0c767ac4a6c2cae464766559f1d8be641b157133"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.1/aptos-cli-7.12.1-macOS-x86_64.zip"
      sha256 "99c7165a16f1ddc6251557fc1f6626229ee16032f9d41eade02e3efc4c83cc47"
    end
  end

  def install
    bin.install "aptos"
  end
end
