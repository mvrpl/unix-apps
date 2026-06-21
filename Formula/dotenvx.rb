class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.75.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.1/dotenvx-linux-arm64.tar.gz"
      sha256 "ccbff6d4aa4cd26e13b3ef8a07999e98361c74483ad8da055b2afdb39a69427a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "926d14b03a8f9cedfa7363d3bd0d274f7c4253211618622f1691adaa40a9d1ab"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "4a3f52cf3dbd4e5a506f768a709b1b016193372b04b43050bc1b9c610c9b78fa"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "6f42789b07cc4f69aba1cf9e7c45a0ff8ef30dd3fe4e3423f431835655bf8d34"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
