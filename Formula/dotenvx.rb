class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.10.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.10.0/dotenvx-linux-arm64.tar.gz"
      sha256 "d21be3f0ffda9b38904a2f91c3afa6d39754560d443e9e6731a0ccd1c4901c0a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.10.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "df53ad5465ea8d92174b4e6c12c21e78ffdaf8a9cc7201c16c6558534d601f65"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.10.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "610cd67c86037bba684e96ad41d56614cccd71a2ce7deda6cc2b2d189cff2cfc"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.10.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "fef083c9203e1a75b28e79689eac88932dc3ad831b2cbe9bd4ff8abbc6d3ad70"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
