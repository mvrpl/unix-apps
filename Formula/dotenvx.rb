class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.65.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.2/dotenvx-linux-arm64.tar.gz"
      sha256 "64550125db0ad1965ce7c2fdaa4c11a9f4addfc8b813291b453c5f9fd519a17f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "9ed7bd6c995e219a7394d00d50a62df7f50cb2261542e69a0e30e91a296c7600"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "6123840f010245a0b22f9119bafa8980ba10e5da3f318618c4f62d6ec46351ac"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "b0e90cbf51578205546b47ea03571aae112cfb072d29faefa175f39a16b22855"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
