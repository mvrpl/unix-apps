class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.58.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.58.0/dotenvx-linux-arm64.tar.gz"
      sha256 "32f2a31316b2b8f5040a17e78df87d4242623dfec83ad1d2e9f2d51ed296716f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.58.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "ce7387b46a36587e088a287a93b47d08f610e9ab338dcf93b5c499de613b6f2a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.58.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "95aae203522c937146047477f8d2651c62c01a1ac23825bc60cdf0543312383d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.58.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e4f6b01c7031b356b55120f86a3b4ca2dd38ead501717fff2ee250d247316168"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
