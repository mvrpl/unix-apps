class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.7.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.0/dotenvx-linux-arm64.tar.gz"
      sha256 "a7f90cb053b0638f3aa5e6c0f0fb7c02bb1371e7f42af8eb56c42c9b8ed4bb03"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "af516079cca0e18fcbf0bdceb746c5ea52572e921f270fb2b079dfd3d0eabf1f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "9ef2c3d9c064b443db56aa7fe6ad1fac962624a7e379560ba68f950d56c08125"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "bcff866c8a31102fff96edd3e1a0e4240c5f5669dc97ae09cbff8330bcd0ffce"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
