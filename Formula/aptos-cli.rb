class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.3.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.3.0/aptos-cli-7.3.0-Linux-aarch64.zip"
      sha256 "c5c0ad106f348eed6f30b2e0573c852b9d204921ed3ccca9f3caffe42fc1f072"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.3.0/aptos-cli-7.3.0-Linux-x86_64.zip"
      sha256 "3ae1d637d9d784f1138a76c9769197b0c452fea3cd64b2972c8db2e4b99c0136"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.3.0/aptos-cli-7.3.0-macOS-arm64.zip"
      sha256 "4739abceae339d612c8985ea41f358ff150c917692038b53e706b6bc2f8c29c7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.3.0/aptos-cli-7.3.0-macOS-x86_64.zip"
      sha256 "03f14be4c6470b44d304fc50c4db97a5a28dd86385f2d484e39b05521fe4427f"
    end
  end

  def install
    bin.install "aptos"
  end
end
