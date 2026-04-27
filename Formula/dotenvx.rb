class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.64.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.64.0/dotenvx-linux-arm64.tar.gz"
      sha256 "526de5d82a654df9aecf924bdca58f2227717bcc2f0cb4c38b7f820e825713d6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.64.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "666caa10d4c9fd97535982e989ad304bf916b9ab0611536e2f6adbc7ffc22c18"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.64.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "f016ad694db45826a654a65a28bdd4c028cb379d042a6473b7fe621e0267841b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.64.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "9bbdfa97efdfd1829ee6528bfffff18545fc83a1719cd3fa807adedf11bde37b"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
