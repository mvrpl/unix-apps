class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.9.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.9.0/dotenvx-linux-arm64.tar.gz"
      sha256 "4137381d7e24053c0bd6e71b4c74391214b10bac3af79f4d1934d1636973a1ad"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.9.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "50ac42430014e7e2e5c979f71b256b61b71a96dd6c24ad5dd7c4daa72c4226aa"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.9.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "f0dd0bd8ae7aa7ab49fe4de2f279964ccedba93cd7755646b8699a77a67b4dc6"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.9.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "d03268f213d11e4b2a61e8e21fbf58e1ff02d5a406b5b82f21139d3924c095cb"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
