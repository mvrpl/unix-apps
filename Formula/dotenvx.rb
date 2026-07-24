class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.17.4"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.4/dotenvx-linux-arm64.tar.gz"
      sha256 "e3a17fa05ed00eccaebdc45d2a716c0cfaa380aac9d81218c4ae0a994de88c47"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.4/dotenvx-linux-x86_64.tar.gz"
      sha256 "3e38492f826148db16dc81956ff388cbefbbfb311c4ad07837d98572cff93a8e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.4/dotenvx-darwin-arm64.tar.gz"
      sha256 "6d192aceff97496c2a81d04bfcf416f0327c8fc67961a0b82ca39750900a2840"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.4/dotenvx-darwin-x86_64.tar.gz"
      sha256 "a828c5dfd7ee2714f4fdd1e4675d4b9f799404abab83f27e8fa59a244a4610a0"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
