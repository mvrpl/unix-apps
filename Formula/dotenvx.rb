class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.3.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.1/dotenvx-linux-arm64.tar.gz"
      sha256 "ef91a8fd6314ded4db99f018cfbe57756d4cbc6da2b2be5e0a9e4326aeb99a31"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "071ed85b4ef58ac241d8c6bd2aadb882e9dd03d6a00498ecc673bc38edb08089"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "81550f76de072540263e72a856a83b48128f8ed73ad1beaeea84d221d0d31b87"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "2ed452218c190e0b6106440dcb8645dfcd80a646cc0f16d261eb46d311382b8f"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
