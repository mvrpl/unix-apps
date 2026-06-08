class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.71.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.1/dotenvx-linux-arm64.tar.gz"
      sha256 "2ddff00733efd4b1de24a4d117b6ef66ee449f64b92a00413ef884de2872d4b5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "e5a28b1d1a072991409329f317e83bb5ff28c3bc169b07fb6b82ed643e8d2d97"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "71dd017be3b1de5b5f3c6a228dc78316542f8bc7e019e68379671f2a80538f32"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "effac213e4096e778de5fd8ad90f6d1e5eef86c82881205ab1d9db8c937e2a22"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
