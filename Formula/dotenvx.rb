class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.61.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.1/dotenvx-linux-arm64.tar.gz"
      sha256 "04f0aa74a60a0d09e2bbc8fc4f532f2ffe164c37eb90a2059c32df0fe1f60ee9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "98c98b203701eb3af7682da4966f221221c58e47a8b6c60f2e9b00b607762a6f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "1d3c609877742af6270e6a913640806fd000e0bc5b80ba0847248349ca9c4d95"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "2c3f9920bb6ae8f910a23de695148e2079598d108833aa71fa08907f354b74c9"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
