class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.75.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.0/dotenvx-linux-arm64.tar.gz"
      sha256 "80ff28d4b7e97875068ced40c62664f1356e13a9d9350cbc621b8dc2b3bbd9e3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "d76a35340e7f0b93a0b45385aaca0ae37bce22ef6b077dcafc8bc6d3917f8cd5"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "ab7730befa194cd270326f3d68f56749558b3010373db51644c79121be338ad9"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.75.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "8b5042afbe2706b4fc519ef6c188c222960c5a605f4cf8e59b052724a539876f"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
