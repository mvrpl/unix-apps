class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.0.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.0.0/aptos-cli-9.0.0-Linux-aarch64.zip"
      sha256 "0dbcdb03f2978ef5dcc66000cbc7907a74b92f4f71192d8f7fbb1d3e01c48268"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.0.0/aptos-cli-9.0.0-Linux-x86_64.zip"
      sha256 "5c7d03e59d564d13b9b8af199acf755bb8591ff75813ee425228f2b2a406b64e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.0.0/aptos-cli-9.0.0-macOS-arm64.zip"
      sha256 "369f3967cdd7933579f51b37bfb4a37d011629d2c44db15af8747e1918ad6d82"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.0.0/aptos-cli-9.0.0-macOS-x86_64.zip"
      sha256 "47a6b7ee97394200aa1b7616c994efedde0efe2ff7e231858fed3e57930858d5"
    end
  end

  def install
    bin.install "aptos"
  end
end
