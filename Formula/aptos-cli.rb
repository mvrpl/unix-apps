class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.5.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.0/aptos-cli-9.5.0-Linux-aarch64.zip"
      sha256 "98d8c23d45b82f7dadb6abf03561dc0b315e5c0aa59fa0b378e3c8f8902a5626"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.0/aptos-cli-9.5.0-Linux-x86_64.zip"
      sha256 "5892ef23974436f1eb945129f82b7a43e87dba4120e56e6ac3ef39e3d8fbf39a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.0/aptos-cli-9.5.0-macOS-arm64.zip"
      sha256 "6f8e2eed42440aa78e11d0e42d24ef918b0bba3ef57b80b118b4b9b5134a73f0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.0/aptos-cli-9.5.0-macOS-x86_64.zip"
      sha256 "6a7efb25c949d4699445c2e76dda6229aa12b23e201b927e99578891c2955bf7"
    end
  end

  def install
    bin.install "aptos"
  end
end
