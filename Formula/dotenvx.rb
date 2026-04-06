class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.60.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.1/dotenvx-linux-arm64.tar.gz"
      sha256 "c3d4d0425d8a2700e05187dc81660c2b3218e21e3f88410c9b882f72bfbeee74"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "38281737b7ba2c8f1dde1b4fa854b6f5e8f667639c8285be161a2e49e285707f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "7b061e621717141569f44829a9745c59b4e0c45bbdc31485ff3803f0af837e0e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "dbe22fd10522341b3f6444bad9c39157ff3b58937738d8bc60d6ee3364d4c230"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
