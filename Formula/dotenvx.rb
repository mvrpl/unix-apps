class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.61.6"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.6/dotenvx-linux-arm64.tar.gz"
      sha256 "c941bb9fa20a160bc1988bb982c5d4b68e2b9a4e0d9d2e9cd5566cce9c198edc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.6/dotenvx-linux-x86_64.tar.gz"
      sha256 "bc9bcb95ee8b16d178bc8e21460b3458843ba8d5b8065f780fdeb14ba50b5c70"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.6/dotenvx-darwin-arm64.tar.gz"
      sha256 "6d1b13c3523dfc1769ff76b43fed82c684dd27577f7ab8abbf98b08f1ecbcb39"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.6/dotenvx-darwin-x86_64.tar.gz"
      sha256 "4edf38f860db0425b3b355bfc36040556f8ff7818845791faa479b622e0e8333"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
