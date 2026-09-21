class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.29.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.29.0/dotenvx-linux-arm64.tar.gz"
      sha256 "538cb7b4af4da29630a4f95986f26bcd154f8632ad13f629ad8a217191e29eca"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.29.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "86049d57b0a733235073af8dd4eaf747e3adcdc09a80bf022b470a3438e14dc3"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.29.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "85903167852a17f2ab276ad69f6ca9c70d8603d589ed5183eee27f04bdf0832c"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.29.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "53a66edc624f6b22d3808b88b2244c556eaee7383c390b139bb4eb647de9876d"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
