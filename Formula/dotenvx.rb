class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.55.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.1/dotenvx-linux-arm64.tar.gz"
      sha256 "e58aea4d58a8a7d2e625d6f5b7ce40cc844663908f20ac6ee4ef6b2dfd3300d6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "f854ea2b062277d195dc06849dee4ed334a5bbbbfc3a70446dd4f9c401856c5d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "c495472cca9dd7de2345e326665fec711fffc49357b5efe48bf2bf9ed9fffb00"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "345d0d49567970a2d6c5de2c994411a16ef62ab0747c0a3d62da1fce3c44326b"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
