class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.69.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.0/dotenvx-linux-arm64.tar.gz"
      sha256 "ff3c78b771c35f2f4a7b3f31ba951e43d2d09a7aec70f02a6b4f5bd2e3fe17c3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "149b448732ee678c91bbdc4407194df21bc32633e5ce6eeab8b954fb2fe07ad6"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "5f350993c16f1d9e56bb5b36bc1737e3020436f4499c460ceee08213ef508756"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "8a6db1486e6d755fa6cb92bfa72b9f67bf5d64bbd333300e2e07a42aa321bfa3"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
