class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.35.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.35.0/dotenvx-linux-arm64.tar.gz"
      sha256 "d6f5b6f5623d5a04f56716d294bf4c69ee62ff8890cb61fda77e49031cc0bfbc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.35.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "68bab3122b07d3c9779d9df8833614fcf0b7cd3eff3983d11976089ef1698b4a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.35.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "1200e1c77c17b5d79c21405c6d8864e375684f9f6ee930cb756dc7808fb76bd6"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.35.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "c7e42fd597b6ea65f136b26d8cf36fed6da18d79a698b92d066f098880606021"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
