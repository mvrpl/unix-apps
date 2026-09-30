class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.32.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.3/dotenvx-linux-arm64.tar.gz"
      sha256 "5b477d96fdd9c341373a302feaafa525e7dae0f729eb7723138191d97219f4c7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "3c3f7d1b9c72b2865c0e958da5c45ece6bb4a69e5e083a31faadaedf2deea209"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "8f04248deb66fa29dbd0c78512fd336c31e35f8692022312f67f69ed615b418d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "f43df78dcc631fcc4562b22f4d28ca72d53ccabc88671d4534cb54cd3a2db061"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
