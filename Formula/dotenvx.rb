class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.26.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.26.1/dotenvx-linux-arm64.tar.gz"
      sha256 "afc93673ea80a849852b63f2bef9b139d3b2c92b65527abd032ad523679e6cbe"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.26.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "149e8b2b537b5d9e13cd0eaaa38828fb72a0276695740d120c4eb1963192522b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.26.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "81e07b1b3a34d6ee138b5ac53b618870c6a71b7ded782ee6aa11e67111d928e7"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.26.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "8c563dc8187af45c01ef74ed5afc7cd840a101dacf4a4d40e597cb882b4d2861"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
