class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.54.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.0/dotenvx-linux-arm64.tar.gz"
      sha256 "d73e687f6dddf049fe890b4dff8770ae44b5152999e89945359e29cc96af1922"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "e6f66cc3d0bfa41bfb42079c9bc41f73528ca6fdcb4719dbfebb3ac3f0af24d6"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "c296b39ed416d137f2a3df1192c031db406536067eb1c0daeb2f082c1ca054fa"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "60296a0e5c43dfeed442e3d81bb4833bc0c730443d72f714032ed249c53c276c"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
