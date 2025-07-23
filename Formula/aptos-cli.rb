class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.6.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.1/aptos-cli-7.6.1-Linux-aarch64.zip"
      sha256 "cde3e96f0c1b8bbc4ef003edc8ad74c9a670a66cf51fa9ffe4be27cf04c8146a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.1/aptos-cli-7.6.1-Linux-x86_64.zip"
      sha256 "c26226c387ab8d92fadb3741d68285b7d62d20fef0cc69d7aa0f003baf354da2"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.1/aptos-cli-7.6.1-macOS-arm64.zip"
      sha256 "de6019832055a50a0e722d05e1d8568dccbea1da61407353ffcb2b4de177763a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.6.1/aptos-cli-7.6.1-macOS-x86_64.zip"
      sha256 "1df26bf04a676521cb530978ef50a376a4b74c4912f801d5b3a2c9029c6cbe8e"
    end
  end

  def install
    bin.install "aptos"
  end
end
