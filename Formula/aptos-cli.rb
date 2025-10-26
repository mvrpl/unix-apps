class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.10.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.1/aptos-cli-7.10.1-Linux-aarch64.zip"
      sha256 "99c888a46e95f8d66c268a079c1581a71840e681312ab1b4f5864621f6f7d82c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.1/aptos-cli-7.10.1-Linux-x86_64.zip"
      sha256 "12622295237129765e90db97572f9a5fbe4652dee3757e119900aa7911bf375c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.1/aptos-cli-7.10.1-macOS-arm64.zip"
      sha256 "7a5d1014afbe357cea64a03bc1cec65757bdf11eb1ea839322985fa3023f0f29"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.1/aptos-cli-7.10.1-macOS-x86_64.zip"
      sha256 "0bbb5869e208f28f066a690db4f6266b6ddcaa60bb4818006b24c7fc64d47235"
    end
  end

  def install
    bin.install "aptos"
  end
end
