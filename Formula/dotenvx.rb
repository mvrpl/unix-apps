class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.57.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.1/dotenvx-linux-arm64.tar.gz"
      sha256 "35ba84a7432933043f53e504faa17756d3e642579b2efb03af479e89e6e19d1b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "abd9299808c2f0ae00faedde7bcfb9d53d310ff79a676d0a36a6ba52ee9e7157"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "6ec22d64e347b718ebfaf626b90a478e8bb8d671313af54302b0ef3915ae38ef"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "c8e29889771ee1920e40b2ea2ecf2a7d6be015b8667fdc355b111deae932b555"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
