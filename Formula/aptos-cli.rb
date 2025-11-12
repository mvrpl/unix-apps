class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.11.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.0/aptos-cli-7.11.0-Linux-aarch64.zip"
      sha256 "c5e485aeabe0acdeb56e7f5b0c479a4d703e872becfb893f5ac5927c3a7756bb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.0/aptos-cli-7.11.0-Linux-x86_64.zip"
      sha256 "a7747813524f60d7a24490e47501cc1dc6456e1c743e3ea9f990e57366be55c9"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.0/aptos-cli-7.11.0-macOS-arm64.zip"
      sha256 "e7908c36645a4c1060dcc3cc15c9541705cb3f729c13455d2e363c8c131e7cc6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.11.0/aptos-cli-7.11.0-macOS-x86_64.zip"
      sha256 "41dcdb778e4b2c0c5e4df3fc5da81f171af06bcc43360a290362a650fa980524"
    end
  end

  def install
    bin.install "aptos"
  end
end
