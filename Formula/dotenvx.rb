class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.52.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.52.0/dotenvx-linux-arm64.tar.gz"
      sha256 "08bbac56477c5dff1b61d80048ab5e49acb43d63b13be81f2a64dc38ad03db91"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.52.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "a7019c5f1385266cbc90b8256cfd4218a3873dce31dfcd4556001db7c02c7fbb"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.52.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "c4b21606f5e4ff66fe85854d283a0077e2179ee0f057d8c7e4bf91e7eaca1403"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.52.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "4a55590c05989b048126289fc694e1a55b80b8e3ce3e7cbad7f9eac090f98e5c"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
