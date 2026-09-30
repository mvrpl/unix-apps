class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.32.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.2/dotenvx-linux-arm64.tar.gz"
      sha256 "fd542ec7cc10cdebfdeb11de47f0e1403125160d3409aaf0eadd9e9e279a757d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "9a4e1dfefc5b3464280b3516d0bc839fcba72c7dc740bc252275558e0377d493"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "c409bb832e9a5a3c90b914293f4f907d2a9c1875f703b2035bad99c2d1c64a86"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "3f5e0a4131b18f55be031515d61e8fdee61b51de8029ff42b13a9af8eabfe45f"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
