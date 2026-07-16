class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.13.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.13.0/dotenvx-linux-arm64.tar.gz"
      sha256 "29f5d2d1d05215e62addf1bbec8e60a133e3d9816d0889a7382efa5ffea6523d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.13.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "1d6c865bd680fd339562fc8501b7cd59c290206464f0be907f4f5f39508bffdc"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.13.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "fbbb2751e4ef8e7bca35aa2562da4b72918021873a9fd805b633f62b1aa111a6"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.13.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "7f064a0a7f2b2d14f4fc21800fc7a0ef3fc099af1a24be4cf35302f89a86bad9"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
