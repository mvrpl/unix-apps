class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.8.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.1/aptos-cli-7.8.1-Linux-aarch64.zip"
      sha256 "30544fbcb037460332b5173f2c26df81bc9fc31c977007f31a2e428c1903ee8a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.1/aptos-cli-7.8.1-Linux-x86_64.zip"
      sha256 "0aeb90d54bb5df0d458c609323463bc1d5db6dae5e83ae64f6fe86dc14e1fda4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.1/aptos-cli-7.8.1-macOS-arm64.zip"
      sha256 "8a915ce07672b2e4fe09d80a70966fe3086128d028cb02a77d8674884d996e06"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.8.1/aptos-cli-7.8.1-macOS-x86_64.zip"
      sha256 "ac49e518a8e750a98559a9bdcc1240b8a2dcbe07c69a8a23550020a4fc758186"
    end
  end

  def install
    bin.install "aptos"
  end
end
