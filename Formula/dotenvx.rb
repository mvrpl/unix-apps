class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.19.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.1/dotenvx-linux-arm64.tar.gz"
      sha256 "a1419f1473a200d8eaa1c87a148b5bca1564cd77ec1da7e5c596e65cdf06cbdf"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "a114a4fba02d57dfb1242fee9d76a5f381c7f08dace303ffed5e6a5cac33d208"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "ada9fad15d06730d7e5d72d0873b28402ae318c0ca6c937d6b383f1ca51aa720"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "ceeb12284a18be98d14472775c69c2ff01f733d907d9a2cecb9ac4e977f0acb1"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
