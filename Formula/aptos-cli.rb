class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.11.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.1/aptos-cli-7.11.1-Linux-aarch64.zip"
      sha256 "75def7e116255a307fdbbe8cc0fe690ba508450f948f8f092b233cedd0c5ffde"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.1/aptos-cli-7.11.1-Linux-x86_64.zip"
      sha256 "1ff6bd26bd7700869a4c4f6ffcd0689d985d3f29de604628043ebddc60cf0ced"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.1/aptos-cli-7.11.1-macOS-arm64.zip"
      sha256 "60a2ee43dc7be68543a866236c48d5ea4a87736bd5654050e1d349da3409a1cb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.1/aptos-cli-7.11.1-macOS-x86_64.zip"
      sha256 "abca2fadad993962b882dae3c2fc390de7d754f404672b8f1ecb014df5f122f7"
    end
  end

  def install
    bin.install "aptos"
  end
end
