class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.73.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.73.1/dotenvx-linux-arm64.tar.gz"
      sha256 "4591060fe2851f330e0356d675f1347efcfc68a67019d7cd04028e26e403e1e9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.73.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "a561ea9d30d776434065ef2439dcc2382e2870bb81b831132fbd0973f1f04e9b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.73.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "ac95697c82b6a9e919f9790b49318036c3e3b9cd1cf062ffed42c0a779585252"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.73.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "4c6e11a8c21f8280a917967a78cdd3ac95d9d02326a0ba0c25a4e5067ce14fbf"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
