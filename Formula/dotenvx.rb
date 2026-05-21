class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.67.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.67.0/dotenvx-linux-arm64.tar.gz"
      sha256 "7bb74bf30c9f88fe0798c475b6418a01c374d012c3b698ece7c3fee0f9364813"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.67.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "ee5785cab99cf696d820a353a1ccfa0bdcfb93a807627250e47ab5d847672f1b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.67.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "8d5388db53eec4085828aae96a8e7cfed6651103d50b261a71e894b5c8b09cd2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.67.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "031da57cea992e8a9c6c62e32c58a35255b4213463a3c2e83e1e0cf3574b887e"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
