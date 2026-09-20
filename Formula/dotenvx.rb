class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.28.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.2/dotenvx-linux-arm64.tar.gz"
      sha256 "6743ad73d4a2e1ed67cb905a98f0b8acaa8c8ab0a8e2329da0f7d10240a93b84"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "900f74b9861d111bea1a4d09c6c0cebf70b7c893c4cc995ea281d04a7d75099c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "92043dab1ade27226ad7ea6fb8d1c7041bc7d0555d212cf10895e4a94092ecc3"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.28.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "2d5b5bd01e4e2ac5e089d0eefb67ab297ee60f0975ddfbd285e21a322b15f472"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
