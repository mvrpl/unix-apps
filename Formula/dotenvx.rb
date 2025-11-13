class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.51.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.1/dotenvx-linux-arm64.tar.gz"
      sha256 "6e273fe23d7dab9602437d5305bf6694574542209d5a98b38a48c265f26b9ce9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "6cc5e0dbd3470ff79c6aa0cb9909e29f6fd4e7b2050e4109c7131e743c55c73d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "b8b3fd84e8dde0bd71d0cd5efa4a94418bd50a6e15000d2999dd487a59406c4e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "d4369ede02109eb1c113ca7401d1cd69fade27b850f6f17d921bea8b74f7d90d"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
