class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.68.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.1/dotenvx-linux-arm64.tar.gz"
      sha256 "a554dbe9f38b37e61d9d1495d90ac392b130b3441cdb0a6d9a55f073b13d6f94"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "5379e342be05c68fd52ace9ba51201a5e1fdb28644c3fa36a252a5dd3d2b27d8"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "a788fbe16609616e94dc76091abb0d7be6ab42cd7a9d76ef2d44cf31b12f9600"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.68.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e3168e547d0c1c665984c756f6b0d9b664d8642b221440a91c279113247da2ed"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
