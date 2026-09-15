class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.25.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.25.0/dotenvx-linux-arm64.tar.gz"
      sha256 "3e75d36dd35126f4b1e159d232780ff958e4ef4a10e4947d9a1cc09a1db76cf2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.25.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "950621d900f3fe01658b030b759ed658843ec9726a8bd94bf1f57551733a9590"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.25.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "87eef2b9ec086d5d4f30a4c1ea676ad3d8a6588b796b7412501dca4787038a59"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.25.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "0126f4c81a0dfdb6f30618ccd6549a603f38a9d10007040f378cb29895d5304a"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
