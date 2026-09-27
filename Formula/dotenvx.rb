class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.31.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.31.1/dotenvx-linux-arm64.tar.gz"
      sha256 "1a72f0048218a13bbcd3e70848038cffa3e5184e2a92e8421b72a3eef94b1468"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.31.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "127e951f1728ce0bc63a1da86b4c8d30c46e47f7c3a69f443ad67aa243dccc19"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.31.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "18058a6c1fd0e6f0eb8b4c8ab32d42a97090ce2694e618d1079de5df175911c5"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.31.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "75734ad2acb8308a1694790962f716d0e49e4fc69d4ecebddcac94b16aa014e3"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
