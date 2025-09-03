class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.49.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.0/dotenvx-linux-arm64.tar.gz"
      sha256 "68e81a272ece56014479592da58a382b7d8ae21a636595adc75e6238f9e75e1f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "e0d4c19ddd68a6d8b360b70dafcdbaea7ccb3efa6dfaf5c51647e94075fae030"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "1fef9d4ad5987323028b1ceaa8eacdd3019316abfc234ef1862684aeeb5ae6de"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "9cd17a4cc0a5ecff6f1a8a2e5307efb97bb3f8fe7a23220aedb1323a475f8154"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
