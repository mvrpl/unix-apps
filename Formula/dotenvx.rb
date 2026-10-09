class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.34.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.1/dotenvx-linux-arm64.tar.gz"
      sha256 "91119d862b98568c67eeac501f82b1076a702e24898bae88ebf1a13b7548e453"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "889781d92a7279b12f6d86ec16c97dadfcad448b825b53dab219dab766abafc8"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "3386309982f52c5dbdbc03de9726de831e08140f4f8e54bd95d7da026b05640d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "9485ce0dc0f1ebd5d5e5428a3819b9b294b4059b6efe8827cbae168152c19a38"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
