class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.72.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.72.0/dotenvx-linux-arm64.tar.gz"
      sha256 "23fd53d23c2405b817d7f63902f686f92331ff9b3d9ff7ded72edb8a3821e04a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.72.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "7926925010db1cc02e42712a58ed0ff74d2e826c51e65cd3b74884868384a634"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.72.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "40ceaab06bce786d6bebda4f79fd8a6dcc05c0b6a0d6fbb37f4aff77b72925ad"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.72.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "af8566d48b9629c2af1e1d71ca7ed3682b32f95efa7d27fbd844fe9197061a9c"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
