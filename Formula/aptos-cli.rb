class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.14.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.0/aptos-cli-7.14.0-Linux-aarch64.zip"
      sha256 "a9ee843efefb150ed6f509ae3c3897e73b211e28d7a08fff6fcd8799ca47ed91"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.0/aptos-cli-7.14.0-Linux-x86_64.zip"
      sha256 "c08e77f23779beeac80a80a821211985ae6c371fadb26445db3b57529c5e56c3"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.0/aptos-cli-7.14.0-macOS-arm64.zip"
      sha256 "c76ecc3a93943541f88bc2ec21d1dc64a6696901650c73944c132369e195d77c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.0/aptos-cli-7.14.0-macOS-x86_64.zip"
      sha256 "9802b9a4a7e4e37aac653fbe258844a08a557053610fd8645d4f9626b1e83f83"
    end
  end

  def install
    bin.install "aptos"
  end
end
