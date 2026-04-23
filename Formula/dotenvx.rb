class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.61.5"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.5/dotenvx-linux-arm64.tar.gz"
      sha256 "5c1968f405d70e0dafbf7560dc729069f08958b9d2cfcdc7c77c1e42d5555c6b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.5/dotenvx-linux-x86_64.tar.gz"
      sha256 "29e185d708f311a81d66f904a0efc0987d790b8397cc15da4ab362d55172c3bc"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.5/dotenvx-darwin-arm64.tar.gz"
      sha256 "f23216cd4720624b0761004c50b5d06831e40bfc220b75e05cae143088fbbdf4"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.5/dotenvx-darwin-x86_64.tar.gz"
      sha256 "3c97d1d92dc69f5eef06b7445ed46f217f14c948431297ba2460261d86110c36"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
