class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.62.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.62.0/dotenvx-linux-arm64.tar.gz"
      sha256 "e4b62c6f578d27c2e8eb7fbe13fc128d30e918396cb72f5a5430187d7297815f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.62.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "7b50617da9395ef56d485d3fcbd110d377755258150f43366332344817d5b2ce"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.62.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "f730351091f1e437c7d0d0ad53dcd002d54607534c3f06f8165a4bd6d9d2d3b9"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.62.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "5326c97b9bbc3c3286675df449da8dbf407036ffa8c56c3caf7fa668ec523c22"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
