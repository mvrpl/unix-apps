class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.71.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.2/dotenvx-linux-arm64.tar.gz"
      sha256 "3f62c05efc8419115f655d351be03480ae996355aacd279b92ea1c58b2cfb6a9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "097573bacd9d3399a4a14e9a82d4425a208dee2780fd46f78eeb82268c595984"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "e7678cadd15d9fc9dfdf9578b5399c92de10e6760dc5d0f706d113b8197eb5ac"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "2f2c9199d7727593feebf4d7e53fdca3cce2f7ef6fe1b9a4b36331c7d07edd1d"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
