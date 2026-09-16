class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.28.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.0/dotenvx-linux-arm64.tar.gz"
      sha256 "783f1e55402131ef40f58a779e6bf7536be8244429d6708cb6e18c1775907f66"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "2e09346020193967dd8c72cea7e9219872676f22f9bd20205ed72f7c6accd994"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "eb7156249da3044e907b1c85111d7fc6e08b62665c3cc96bd23f54c64c9e39c0"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "d5d03ac50e9eeb4e6d7e4dd647240931eb231c031bc8ed10efb54c4236489dcb"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
