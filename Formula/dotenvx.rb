class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.66.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.66.0/dotenvx-linux-arm64.tar.gz"
      sha256 "9d2015efdbafc7291617ecd36130803a6e06380d59d2f6052fa69bfc5cea1de3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.66.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "33580dabb98f229d06f13ff35eefde31622c0f1801c89c80198b4046f60b6c3d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.66.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "fd9612f0e0f9697e1922aea324efebd7c777278014d5604ccc36d1cff9a58d3f"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.66.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "c43792afe17c115ff4939b7ff96e4791980a720a6b2c8f4813af26fe879b497e"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
