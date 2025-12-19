class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.12.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.0/aptos-cli-7.12.0-Linux-aarch64.zip"
      sha256 "5babcb8fa6fc8de3e46afecaeab61b5bf901a1c47426fcfe2a0b0477e2907e8f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.0/aptos-cli-7.12.0-Linux-x86_64.zip"
      sha256 "39c5d4280d11c68a0be61d49b875e0edcce98831a0bb7c36221d6e12f28197af"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.0/aptos-cli-7.12.0-macOS-arm64.zip"
      sha256 "3e9e4a68a5ff06cfb5f4ec20fd9a5af6e3d9941bb3fe8b8d155be7a54d5a18b3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.12.0/aptos-cli-7.12.0-macOS-x86_64.zip"
      sha256 "5384fc16ebe7ac8e8154470d4373678bb497715b1362c4ce7dc473b33fd43cbf"
    end
  end

  def install
    bin.install "aptos"
  end
end
