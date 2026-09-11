class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.24.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.0/dotenvx-linux-arm64.tar.gz"
      sha256 "2798175f1c2cae906d7a8e7003638381f56b54dc7ebbca41fe8ed29f6456181b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "5ba3263101ef97e190f6f6a03ce7720cd673cd0329507b3e3ac82aaf8485c7f4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "899c2c128a48a7b09ed8988a856be3a82c2839204d6b8f6cd1b49b06fce703e9"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "6f0feda9ff35b9c7c24da9a2c9253ad333b0e7e8c3fb90725c0813ebe231c794"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
