class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "9.3.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.3.0/aptos-cli-9.3.0-Linux-aarch64.zip"
      sha256 "397763ec91e389eeb10d9244ef3df30ba465e8bde667b42b24b437056d7e7311"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.3.0/aptos-cli-9.3.0-Linux-x86_64.zip"
      sha256 "cbf1d55360cd7f85fc2e80532b5a10d73d75e6dba01386d6dc1b51e98635abf8"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.3.0/aptos-cli-9.3.0-macOS-arm64.zip"
      sha256 "6f5612a383d51d4249205d0efc18464bcac75eb1e6e922898fe52f554ff6c0c0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v9.3.0/aptos-cli-9.3.0-macOS-x86_64.zip"
      sha256 "2718847a21c0a5bfe5f17593f54a7a0923963f873aca33514eb04c623c9aa659"
    end
  end

  def install
    bin.install "aptos"
  end
end
