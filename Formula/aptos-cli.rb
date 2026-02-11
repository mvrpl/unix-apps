class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "8.0.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.0.0/aptos-cli-8.0.0-Linux-aarch64.zip"
      sha256 "ff6d779faa174604e5a9dc6bd9d513042e65b868d7ca7dfcaace16d80ab95a42"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.0.0/aptos-cli-8.0.0-Linux-x86_64.zip"
      sha256 "08d9e6a2eedff7d2f84ae769499dd502081cd742248e41e94b7a5eeff9e731c7"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.0.0/aptos-cli-8.0.0-macOS-arm64.zip"
      sha256 "032b49844b55973cb95a9e9740769b41f2c84aee04473c9461eb95bd4018ebaa"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.0.0/aptos-cli-8.0.0-macOS-x86_64.zip"
      sha256 "ce27df06e3ff3eb4022f0f4d53819b2185b5bc6b11d4495dcc37cfad35f2c3c9"
    end
  end

  def install
    bin.install "aptos"
  end
end
