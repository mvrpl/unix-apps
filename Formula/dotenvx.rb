class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.74.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.3/dotenvx-linux-arm64.tar.gz"
      sha256 "44d65d375f81e9b40991ac6a2c03c8beb8068dbdfd970cb985fb46970a7f7d97"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "726c20ded32bdb64c0c9a8cbd226496e490ed68202e77f286cd7d4303a9c30ac"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "5674c195b72f22d40653ff2dabbc108965fcb01f572714b0261265d7138ea740"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "05c74596e47b5632adc9bba8e0142e441521a3e99b2794c91425b007513d95ed"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
