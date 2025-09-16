class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.49.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.1/dotenvx-linux-arm64.tar.gz"
      sha256 "bf274ef6ef401663a2b46cabfd2c430fbf0c109c4572114a8cecf381ac8c90c2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "07163247502ad5f38757bf305488f065255ca6ee465220b56403b21411de2b36"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "22796352d8de6fb38083f67fed483efecb60d6d0a8b215b55d31a1d90a4bc2b6"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.49.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "a2755e1cec32ee37c23069c6d7bc09204cd419209311c48dd4a35cb7e0c05e7c"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
