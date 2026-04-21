class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.2.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.2.0/aptos-cli-9.2.0-Linux-aarch64.zip"
      sha256 "f3d856e3023eb71b525135c375ccbe1714788c0c2ccafc3f2359dc877b147a39"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.2.0/aptos-cli-9.2.0-Linux-x86_64.zip"
      sha256 "c6c0ae20e8599c7085da9c0a4996115093dcffaa5631704f5ae29eed35fb2a75"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.2.0/aptos-cli-9.2.0-macOS-arm64.zip"
      sha256 "695fc75d8cd3201680e2850cf6ee7cfdb53b51057892af2eb1e5ab1b6c8d436a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.2.0/aptos-cli-9.2.0-macOS-x86_64.zip"
      sha256 "957c358f268d60c84002102ca5a125f392c45ca0df6b82559a3d9e5cd2bba007"
    end
  end

  def install
    bin.install "aptos"
  end
end
