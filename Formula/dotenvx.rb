class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.21.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.21.0/dotenvx-linux-arm64.tar.gz"
      sha256 "10ccba55ef9c7040f6b8a4196c289a143725a8b6dd8aced27662338938e6d5dc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.21.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "ffbb4287414805e9342c243b733270575d64b1d0c92f6b638b60caa755b29022"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.21.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "7605bf421441577b6557c3cdd388ff1afd3834bb60084b0958b8cffb419fdfeb"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.21.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "3bdb74b6021bd6da02c596256724a8acc440d8506950b82086c347a7091dadb9"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
