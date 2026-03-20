class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.57.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.0/dotenvx-linux-arm64.tar.gz"
      sha256 "20d1336fd34f7c1136510d1345441358beb32fbadc249de5c40fdc5d7d1fbfde"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "bcadc2478d44fef796db76c065c38f42bec8d4c55b68277d8fc0c9dbc48dda4f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "1ec290500634ed4ba3a5e569b16ec4f6b0e30f3189c28247c8f8fab1ef3dff3f"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.57.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "f37101adeb25ffe68cc5f480b4769d33b9d760eb589f476ec697b4a41f4374ef"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
