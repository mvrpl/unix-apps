class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.68.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.0/dotenvx-linux-arm64.tar.gz"
      sha256 "74aad32fe329ac321c97c8852b67cc967d8e60adf879dc6dcf95451cafa764a9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "6b073706e10d738ed58e16eed85d67b3be651f50e9c9b9da1aebc76a145c6b87"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "5a64d170f8e72f1154d1439f92d0d1d3e1b8d5a10a9bfaeafe46b97361552ff2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e898f259bfb372b541378ebe1d763c7146d7e6ab9a363756b788f8fb49ed541f"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
