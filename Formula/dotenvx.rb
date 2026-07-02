class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.1.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.0/dotenvx-linux-arm64.tar.gz"
      sha256 "bba357682edb8576b52f41c3d7c29b8da40cb157c08488693f0b0088e2c20377"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "7706cbfaccc89dd3b6426f6fe4a1ea5fd52c20f7aceaae8427ba1def7cfee056"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "125bd75db7b8f6f09fe36942fdce1b2f6d3aef1bccd38551b5a36e3e468e5fcd"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e5dae001c4e5865752218b26a5459c00bb14b73a0748feea588694f2b523ff4c"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
