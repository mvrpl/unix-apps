class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.4.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.4.1/dotenvx-linux-arm64.tar.gz"
      sha256 "d55d02c286a5ad315aef9da064e8da6d6687badb08608f1318ce48f87d2647ec"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.4.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "7210f1ef95aebc6d59b7282329f6d6d6a0b8a5e846c201c9b0d3c789b2044512"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.4.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "a849a601853fe73f7e01d8b0590b996839f88bbc43180eb9067b84eacb5cd7ae"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.4.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "a5f67d86d09284cf2915a19db5a2906bc816da9e4ec294f52128e4a8b0434e45"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
