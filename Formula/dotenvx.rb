class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.32.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.1/dotenvx-linux-arm64.tar.gz"
      sha256 "48c30d8aa556a9ea528732ff14f495697ec4994043d77261f6d9606452af16c5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "4998d07c837b19fdc372118bd4f3c2004ed7ed03b2410994a6f13d45da1f4c7d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "91a6d557014fa3d74c981c1f05424b0c2f3c585b8b75086bdd491f39a75a0ace"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e96d9ded94d07e3f64e5e1abae8385af3e70d4f392d2f466149ee76efd519b81"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
