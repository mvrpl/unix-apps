class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.14.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.1/aptos-cli-7.14.1-Linux-aarch64.zip"
      sha256 "48ec939bbca8790896b93dc3ea612fa353cf4549b149219781583aaec819fa63"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.1/aptos-cli-7.14.1-Linux-x86_64.zip"
      sha256 "7283b8eb60b64063ef399619852e2668e068f719b7cfefc62f7317f79f034eb8"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.1/aptos-cli-7.14.1-macOS-arm64.zip"
      sha256 "078550db860e53687ef113fc328525d4d99dac1a9786bbcab637cce4878f66df"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.1/aptos-cli-7.14.1-macOS-x86_64.zip"
      sha256 "633afdd6785a1a9b2bc212b725b6c02f52fe18a612160733e20fa9af38387fa6"
    end
  end

  def install
    bin.install "aptos"
  end
end
