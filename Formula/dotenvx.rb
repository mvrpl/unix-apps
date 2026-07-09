class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.3.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.3/dotenvx-linux-arm64.tar.gz"
      sha256 "a516c08a640fa62df8b5d2aaeb7a184f325801de88b97cc82afd7bcab0924f30"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "096627d1cb399566211c3e02461602dee3d59c1af576181ffcd43f76e768a3e9"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "c27ffc500c1b061313f649a9ec5199b68be1e6b743ce059e86011ac6a52d4cbd"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "436caf17badf30c713bffe0d4b265a93b8b6286919b7ab48cf191cf224a8557f"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
