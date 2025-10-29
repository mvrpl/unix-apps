class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.10.2"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.2/aptos-cli-7.10.2-Linux-aarch64.zip"
      sha256 "d6d11bc3ceebe480465daca51eecf401b4dcb72a038e09ea93c67e9ad05eebea"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.2/aptos-cli-7.10.2-Linux-x86_64.zip"
      sha256 "88a57f25b4fd6b1cf2e057bf37d38265ba405da4a8d1a79ba544edee63be5ad3"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.2/aptos-cli-7.10.2-macOS-arm64.zip"
      sha256 "6b03bdc169303596816e5f399ac2b16422baa283719195b70410e3591ce5a57a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.10.2/aptos-cli-7.10.2-macOS-x86_64.zip"
      sha256 "70cffbd12ac1901641fa1b320720251e304a572eb01648d0ea313a31a65ab842"
    end
  end

  def install
    bin.install "aptos"
  end
end
