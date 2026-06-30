class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.0.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.0.0/dotenvx-linux-arm64.tar.gz"
      sha256 "2900835ffbcea2c67e76735e0ecfa5d2e56c96ffc9e9190a22fda968d46be095"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.0.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "1d1c19e003e40019f730c36acb6f26116386f2de5865868822dfdf7b51ca6a88"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.0.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "5d20b787a1f87f69b6f4394445f277a04e243e21a26f0275b009c99be265b44a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.0.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "29158bd3e8e468588f810861c7170afe893d557dbba70d49c9be108d36f8cbfe"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
