class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.55.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.0/dotenvx-linux-arm64.tar.gz"
      sha256 "e69f50fa72bff2a34222b7982cc38f0277c307eb1c4e784840ab8f4b4feb4133"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "afd05a95b3b414728ceea9d3caaac6f4bbf4ca27121db6a3be97c4e8e8874a42"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "98e314050e2d6a966f82c9fb50dfbadba61e875afdbcd3ed606fcc278b0b2f2d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.55.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "ff650b022a224fa18225ab135c34944ade53fe6e69f8d90f18c133506c6cc3f3"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
