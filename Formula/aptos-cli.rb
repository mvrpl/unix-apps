class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.14.2"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.2/aptos-cli-7.14.2-Linux-aarch64.zip"
      sha256 "7f5acb350f3f3923394634bffa2cee5ffbda72a4b3373d541738d84ca1ab9d21"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.2/aptos-cli-7.14.2-Linux-x86_64.zip"
      sha256 "87284247884b7dcae9b9936e1d58b2cf0da57895cbbf9dcab9c498019eecf86c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.2/aptos-cli-7.14.2-macOS-arm64.zip"
      sha256 "b1122462fa5675691774b86181aa1186fa45252dbc96993422f23ca1f04c0a5c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.14.2/aptos-cli-7.14.2-macOS-x86_64.zip"
      sha256 "d9aa67f39436c6d9a12f8b1c258b990befe29c0d67e477e9ec9d90fe80c897be"
    end
  end

  def install
    bin.install "aptos"
  end
end
