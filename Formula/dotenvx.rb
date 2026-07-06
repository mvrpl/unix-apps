class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.1.5"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.5/dotenvx-linux-arm64.tar.gz"
      sha256 "b45f955a56d5aab50c8d5f6a774b80995e8bd6953be40bc809e85373bd7594fd"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.5/dotenvx-linux-x86_64.tar.gz"
      sha256 "cdc3975f189361373336ab4f0d86c019a004b895560692118fbcf848f19e62cc"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.5/dotenvx-darwin-arm64.tar.gz"
      sha256 "d96bf19ab53ce75381d23086002302265edce3f5611b699959e4948afbb89f62"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.1.5/dotenvx-darwin-x86_64.tar.gz"
      sha256 "6d7221154e9dfe4599c441a195391e42805ab60c975fd6efd1855ec2db063fb6"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
