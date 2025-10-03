class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "7.9.1"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.1/aptos-cli-7.9.1-Linux-aarch64.zip"
      sha256 "2239ef4c8a3ea45c53005182192257d50d3bac9a6634aca89caf41400db2b37f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.1/aptos-cli-7.9.1-Linux-x86_64.zip"
      sha256 "e5699d9289181e5afd60c6bb7bb84b41355a6ab0738452312c9278482add962c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.1/aptos-cli-7.9.1-macOS-arm64.zip"
      sha256 "e34be5589a06bc8a94b2b23ae32d5d31c73dace9bbc09f566ce1995abb457c28"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.9.1/aptos-cli-7.9.1-macOS-x86_64.zip"
      sha256 "302ddf3c4c3608b5430a317f39debd4190068290558f4ab746c42fa7a3e72202"
    end
  end

  def install
    bin.install "aptos"
  end
end
