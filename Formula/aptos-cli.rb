class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.4.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/aptos-labs/aptos-core'
    regex(/^aptos-cli-v([\d\.]+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?
  
      match[1]
    end
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.4.0/aptos-cli-7.4.0-Linux-aarch64.zip"
      sha256 "9f56dc8eab1aaf7cd41dc3ceb1e63ae97e6fd278a1158946b539125bf0bccfec"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.4.0/aptos-cli-7.4.0-Linux-x86_64.zip"
      sha256 "2a7c2852006b1b9cbbd486803ab2d706d7adac5d6354880808611530fa5e3545"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.4.0/aptos-cli-7.4.0-macOS-arm64.zip"
      sha256 "befe0c47d87f939dbfe71d65c9d4e75d36f1a2fba805243833c7355c44b480ac"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.4.0/aptos-cli-7.4.0-macOS-x86_64.zip"
      sha256 "049ea2c591e4c55bf5401fc9ceaa9388cf9f63b76a9f857c55af558f31b3c307"
    end
  end

  def install
    bin.install "aptos"
  end
end
