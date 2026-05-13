class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.65.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.1/dotenvx-linux-arm64.tar.gz"
      sha256 "a513d7eb29a4951f1ac780afda3752bb8a5ddebc3b8928ad61e72f858ed5d3f6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "d8c5b7bbb7d7f80edc9c2ca01c6bfd474f1438f2cccbf0c67905ce70de32726b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "36b546b1dada8e67c823c559f665e801b893f06e446b6223ebe12fcb2ea5c40f"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "49ad6eaceb8b43a05b38007c7577bb4d540a247a3c5bcb154408a22869c80104"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
