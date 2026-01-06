class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.13.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.13.0/aptos-cli-7.13.0-Linux-aarch64.zip"
      sha256 "10a8316d9ae287af8c046523cd8b4699072fa47c860a095cf22e394f2e65b0f5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.13.0/aptos-cli-7.13.0-Linux-x86_64.zip"
      sha256 "f2e364dfae17b20137eb57151fec4f5d06bd0f9fae740dd178fc2696b762851b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.13.0/aptos-cli-7.13.0-macOS-arm64.zip"
      sha256 "101a7c17bf0e341c25bd0e78f531326a096f25508e788f981a3fefc35077108f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.13.0/aptos-cli-7.13.0-macOS-x86_64.zip"
      sha256 "70059172f8966bdf5e2feb516256b36cbdaf0e1bf513d1d11fc4edf2177adac4"
    end
  end

  def install
    bin.install "aptos"
  end
end
