class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.5.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.1/aptos-cli-9.5.1-Linux-aarch64.zip"
      sha256 "8f5743255973756c1e437b009873a112a17e37fa9cde31233943f898fda1ce94"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.1/aptos-cli-9.5.1-Linux-x86_64.zip"
      sha256 "e088eb88883b28744edfe4dd687ef708615caa2dd8c1ee85415267583ca39247"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.1/aptos-cli-9.5.1-macOS-arm64.zip"
      sha256 "d68811fcfa403c6a31d5d94e93a4e092a006efa5db72985280cd791597aa1bf4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.5.1/aptos-cli-9.5.1-macOS-x86_64.zip"
      sha256 "476ec17a2d3ebf83dff0edc3489aba67635484e5d82e0dd84049437a6ee94f35"
    end
  end

  def install
    bin.install "aptos"
  end
end
