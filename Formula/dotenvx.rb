class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.57.5"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.5/dotenvx-linux-arm64.tar.gz"
      sha256 "b876cd53e77c72df98600c4336abd1890a89a127d8e358afc69ac2527f6fd7f9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.5/dotenvx-linux-x86_64.tar.gz"
      sha256 "f3a2be1f3729ea37d37d108f231292625c9b9981b731b4d020bbb02600fa76e4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.5/dotenvx-darwin-arm64.tar.gz"
      sha256 "7ee96bc9e4b9045f33c2024fab0562a66d1b26dba5700060129a38da01063811"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.5/dotenvx-darwin-x86_64.tar.gz"
      sha256 "10d432b3336861f5f7e75c4ad5e0c0f3f8e8dec12ffdb27a26d9e4af14b8a0bf"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
