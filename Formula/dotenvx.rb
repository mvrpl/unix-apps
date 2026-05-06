class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.65.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.0/dotenvx-linux-arm64.tar.gz"
      sha256 "357f2155cc5948c9f57e55070ca94d11bd08af1aa84cf848b2832d2bd01538c3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "db9a0b1278f93f2903cbfd2dfdaa089c7fa47e4df2dd35c1a2c0bf5a4dcfbfe7"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "d7ba8efea3f3e67071c73eaa37f20f0ab8d4c33eabeede3cce511486c467fab9"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "a11952e4b16b76880db456a9968203426cecad87c65902aad6141c48a09e45f9"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
