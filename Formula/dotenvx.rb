class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.61.4"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.4/dotenvx-linux-arm64.tar.gz"
      sha256 "4c9cc2fcd68b3ddfb5657f64c675a102fcd9998d5df51b4b00981f8edafedae7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.4/dotenvx-linux-x86_64.tar.gz"
      sha256 "9ffb414e23804258b8483f37804a191393adab2eb7056d004627b2b70d7d467e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.4/dotenvx-darwin-arm64.tar.gz"
      sha256 "4ec72c8ecf2cca2d712ed0fa7292b2f16a73308dd2350fd041fa1533c4834aac"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.4/dotenvx-darwin-x86_64.tar.gz"
      sha256 "b1398e9f5498acc0af4478215a39274cb8c265d2b20b67d2a81394b9941685e8"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
