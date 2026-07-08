class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.2.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.0/dotenvx-linux-arm64.tar.gz"
      sha256 "7379c2489395517362fbf2bfc4dcccf0fb87cbeae26de6c3927817f3d64cd7b7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "9c42532c003d6b0523070d3e650adf4482a5b1a5f6a5460227ad41e5fd517266"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "5ee64e462a609c5ec79c6fce8407f467d1d9377fa672448a2e2a2b61a9261968"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "24b480b5a142f4bba86ad40b590353673efde8f4cb61b49c78d714063a4960b1"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
