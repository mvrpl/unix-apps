class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.6.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.6.0/aptos-cli-9.6.0-Linux-aarch64.zip"
      sha256 "8e26f9ec373247c469c87c5e0003158eea58c68bf94ff03b74d78870cdfa1cbe"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.6.0/aptos-cli-9.6.0-Linux-x86_64.zip"
      sha256 "4e28e71659a53e8eacff29d127685f2f282a8c008ff6e51047daedc72576bb8d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.6.0/aptos-cli-9.6.0-macOS-arm64.zip"
      sha256 "8b59fcd0ea768a173c5b90c299b6d6f53a9052e91160a98a465416f7330eecc5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.6.0/aptos-cli-9.6.0-macOS-x86_64.zip"
      sha256 "1cc8e173cb4ed45f1365b5d79e83026bd007fd49ae7f74246b4238983ba73d35"
    end
  end

  def install
    bin.install "aptos"
  end
end
