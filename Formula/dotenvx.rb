class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.57.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.2/dotenvx-linux-arm64.tar.gz"
      sha256 "183cca5d36a9d89bf0b32f7e7f57f434c68d9b239bd7f4475814135909242b17"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "0f15d04745c8c2029b3e5dbd6295a8177cd766cb823acf790913f38bee550817"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "3fef8a6405c7c44f07ead5d254629c64bf06f85f9dd5cfb64eb787ec86baa212"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "a7b5053189373ec383a4b6676a24306c93c3e752b718e99c51c6be68b52e4581"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
