class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.1.4"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.4/dotenvx-linux-arm64.tar.gz"
      sha256 "a82b6e748a2cab52ab85cf253fa22845f17a2d76b354e54c897351047c727b49"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.4/dotenvx-linux-x86_64.tar.gz"
      sha256 "5e4ec9ff81f5bfd1b78ec38a5a8b4e086f56ce0ba107526ad11b0bbd3bb216f8"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.4/dotenvx-darwin-arm64.tar.gz"
      sha256 "c61a48bd6fe3e131c5f71bada656487505bc48ed88fd1ea9d7ef87bbcbfe045a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.4/dotenvx-darwin-x86_64.tar.gz"
      sha256 "8e68ff5da50760135ebe7cc982965058a012fba45049366c41b853b5fcdad860"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
