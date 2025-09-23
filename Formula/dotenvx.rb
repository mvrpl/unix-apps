class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.51.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.0/dotenvx-linux-arm64.tar.gz"
      sha256 "e6c60de09f09f87c721819b5cba05e921c0c738741c279a0397b4d1a97c9a4f7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "2b48e23f7532fe2000e65bf54de524344426b1579f5695e7cb22b68f578f6781"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "4fb61a5a1e041f9f133694308ae81ffe8e947bb078849c8a78f0ce0b96ffee1e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "eee59d5e998a36171aa782c5cd5f0256128363f179e1e5519818908142c6e0e5"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
