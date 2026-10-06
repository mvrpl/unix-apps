class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.33.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.33.0/dotenvx-linux-arm64.tar.gz"
      sha256 "e75dea840fe409fbd16c9958bfb9927cfb6176ed72bea98c2308fc018c384455"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.33.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "3844f3e52459df1e16fb92c51b776425d0e8411b0f75149b6aa2593876db1bc3"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.33.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "83d60e39014f223fcabbf53f673b1747ed9cebabf69c0723aef3e565352f62bc"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.33.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "2f7851b91af587f3dda98d30f23dd49bb2d94b5b18788884b023443d72fb5744"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
