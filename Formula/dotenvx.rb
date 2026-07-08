class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.2.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.1/dotenvx-linux-arm64.tar.gz"
      sha256 "b96e9e6e60f729d689e3180550bc0a105ac503beff6229c4deba7df1f3f0db41"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "fa523e23d3ee4e8ee8c757840935ec4ae1315b9aedbb4fb38f4b00d26e91e220"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "a50bc361f6b585acf6eff6067dcef2803308e918df7c48b60f318c05acd95aee"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.2.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "9e4507a48270bf0d15b9f41abcc5416d446b443fc7a4ffbe213afa25c67f62cb"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
