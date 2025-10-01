class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.9.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.0/aptos-cli-7.9.0-Linux-aarch64.zip"
      sha256 "34b5f20f48dddab17a0677fa5e382a78e7428d84de1e322648e51cba8d0665a2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.0/aptos-cli-7.9.0-Linux-x86_64.zip"
      sha256 "004378f728338ccb2f83a68f199e9fe09051376c863774b7a3f65ebe1709b9b1"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.0/aptos-cli-7.9.0-macOS-arm64.zip"
      sha256 "f74bb6527555c7068d1fe9e451d90f92cd961431e5095633b6ca7956d82e9e27"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.0/aptos-cli-7.9.0-macOS-x86_64.zip"
      sha256 "c5f446c0b9eb9da23e0c9813953ffb76502ac58b732bfec6e5134427daa0b9fa"
    end
  end

  def install
    bin.install "aptos"
  end
end
