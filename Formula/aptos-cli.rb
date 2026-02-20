class AptosCli < Formula
  desc "Aptos is a layer 1 blockchain built to support the widespread use of blockchain through better technology and user experience"
  homepage "https://aptosfoundation.org"
  version "8.1.0"
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
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.1.0/aptos-cli-8.1.0-Linux-aarch64.zip"
      sha256 "361b1003c3405f70484ad5842fe5526522950c5bb67da34fb2977383c14257af"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.1.0/aptos-cli-8.1.0-Linux-x86_64.zip"
      sha256 "8c032ed8e6d4ad039164a1908688fd1941edf172ec28bbd3202d5807c42892ea"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.1.0/aptos-cli-8.1.0-macOS-arm64.zip"
      sha256 "27e4ebbdd75dcf864c14b718d361b8c3f08495f43189e950f3ded03e26a1427a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v8.1.0/aptos-cli-8.1.0-macOS-x86_64.zip"
      sha256 "02b3a5c95cd6c0c40929adfc263c3a46d42bed3edf10e993bff2d20417e1c78f"
    end
  end

  def install
    bin.install "aptos"
  end
end
