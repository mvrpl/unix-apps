class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.11.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.1/dotenvx-linux-arm64.tar.gz"
      sha256 "fa11f806a3d3dd44c6de11aeb4907ac628d2185912bc8aecc117814e1265df3c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "9655f8b2a3c2ae9d495fa6c13af732ed332fd0d2fb741640b6f282d2c2541300"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "f83c2191160eb64d0eb9a9c75dedffe7e8a60c21b76aa5443c921cd46be233fd"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "b67523d7c606f7df1d3838c1a2b8b90ea276b4b0697a2cb5f443a8a9fe7bbd33"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
