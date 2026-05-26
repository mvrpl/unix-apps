class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.69.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.1/dotenvx-linux-arm64.tar.gz"
      sha256 "fec9d62b519aa0a515ba9cd3a4712e8b59c441c10c5497bc7bd9695fc82c19fa"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "3a2c30977483b42a2d722ba16e265e9b6721d31a64df0f91f1b5fb9d05abe24c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "d6b9fe61a430a33392f2ccb578a08d8058011f423b35782f2931f6c1ee70d758"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e442624b97882b49dd9fc473ac2d465d0872c87effa7a51eb050c4a3e6720316"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
