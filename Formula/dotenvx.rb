class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.50.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.1/dotenvx-linux-arm64.tar.gz"
      sha256 "756c77ab74fcfa6c7fce36c111facbfac328e404fd15454ee8e70af37a8218ae"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "237a2d39856ad7b310e8d12043e9b480813dbf024972431572b7c0a3f42cac1b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "a9779232a378fcadbaac8783bd79ff9f58fbc169bd397fb147abc386150ee920"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "9f18690c2f5f97338ef6976c65d006edd7e0470ddaedb879bf31e127772980db"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
