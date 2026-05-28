class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.4.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.4.0/aptos-cli-9.4.0-Linux-aarch64.zip"
      sha256 "d5314627ca0919d75951b3c8186cda6306cba098c0971b38b857b8708dc03a82"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.4.0/aptos-cli-9.4.0-Linux-x86_64.zip"
      sha256 "7ec06fb15fff94c3fa6fc29824e90e7d16f84a595b5341fc365a1a0fe973dd1b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.4.0/aptos-cli-9.4.0-macOS-arm64.zip"
      sha256 "2f2b733f97730d299a8f965a1932952f27655c9e79dc57c9f2ec92a1d74ed95c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.4.0/aptos-cli-9.4.0-macOS-x86_64.zip"
      sha256 "8b1e6695d7ccc672c8504d33e1b191e2b616cb8642d301b8104bddd952e2cbb0"
    end
  end

  def install
    bin.install "aptos"
  end
end
