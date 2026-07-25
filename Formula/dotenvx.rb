class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.18.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.0/dotenvx-linux-arm64.tar.gz"
      sha256 "b4b668fe03f6563c930c21cd78f26a391fdee8952ad73c3b733f3f13ff7cb7ca"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "9dfcdb254337614dc0e84ab681669c13fd01792deca3719f973792ba530e9c14"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "0513a1e69d301a7984f70a875d27ce04a378410063653776ca49a501625026f5"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "68f6e5a1edc3d360653071931b6491004a9674e87a6ef853512b3a68004934d4"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
