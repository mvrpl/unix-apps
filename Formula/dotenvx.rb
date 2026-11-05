class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.38.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.2/dotenvx-linux-arm64.tar.gz"
      sha256 "cb0bb6e4cf3ff5ae7be8489d91ee14d1db302be20c531bfc4e18e5ff9207be3b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "18196e97e94124de756cc728a1472bc242c81d9760733880522471f81484454e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "ea9e44fb45aa1726a9ef4be13a553070f634a7487f850e0d88bc5bca10332f86"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "824fcffe44d14857ff250c6058e0bbeb6f7aa25e40a6b8590daece27312b6609"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
