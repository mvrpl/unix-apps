class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.6.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.6.0/dotenvx-linux-arm64.tar.gz"
      sha256 "085bea8178af2bf6b03ab36b273e38751762e48a323b1aaa42276f5964464b2f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.6.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "a9266b284f32d74db95d50a187f91ad0a02e9a5fa4c9879416f9ad23ff668612"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.6.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "e120479eeb20ad68c2effae7e51be1fded863f0515a4726d34d3f958e47900e0"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.6.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "b3be20738ab893943dd55ea280dc42b9428ceebde2b920370f0e6e6905856e3f"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
