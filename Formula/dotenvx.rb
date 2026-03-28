class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.59.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.59.1/dotenvx-linux-arm64.tar.gz"
      sha256 "d321a264cd16bb3e42ef798702d02b55e1dfad24ae12be6dfbe36fc8fbc80871"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.59.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "400b189180e566951713f8df1c7a2e0025655566a6977a85bdc5b7e8a134446d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.59.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "f4e48cc50388e7df243aebbb878951556a8755a8a07c32428c2eb61961a159de"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.59.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "673849157a86a8dc0c9ba544c01bdb51e7da7ef021b0fc04fa37d5ce541baaf2"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
