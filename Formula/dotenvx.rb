class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.51.4"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.4/dotenvx-linux-arm64.tar.gz"
      sha256 "bbf668ebf7eab4cbf4f704fa06a993618e2cdb1611223ca32842494fe4a9b091"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.4/dotenvx-linux-x86_64.tar.gz"
      sha256 "fee10557b14b581325b997ebb8219af47875064c0d19cd8bd3971cf6c2bf9245"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.4/dotenvx-darwin-arm64.tar.gz"
      sha256 "7587a7d433730362a4b1c7e131d1242c2a162f4f73712634cb5f6803614c075a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.4/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e2dc72531938cca09c96191310e413c168cbc196e8f0f3362523988d25eed072"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
