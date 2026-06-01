class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.71.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.0/dotenvx-linux-arm64.tar.gz"
      sha256 "c85b8966d97a44036b988bc4c03f90011fc87df55a9f9c3f81eea32bc640fe49"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "16c2ba23eadcb1ed48cf11cd94794556fbde36acaacf6a09b1824ca070e9c210"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "a67116b86410fb79447c92367dae09e64fcf51a1ae3f92c9c241d2cb11f1ea8d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "f00fce0bc9934336158a2638717bb1682087bec012eb532e5d11be94e039f28d"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
