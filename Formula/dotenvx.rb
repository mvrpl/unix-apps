class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.22.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.22.0/dotenvx-linux-arm64.tar.gz"
      sha256 "522870dd7f3c6a9125caef4f8a15818a764218ba4970c59513689798664c9b82"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.22.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "444e32d1a5227246cba3f60cb419c5a8fd3024c6aac839a3fb9b429f72244c72"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.22.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "e7ff04ffdb53935bbabfc180c410a19772fe35df5acc007f9e3f054170a4ad43"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.22.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "c095b95629700ab0051155648672ec961e39c0d5174e9236d558a0933802f67b"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
