class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.71.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.3/dotenvx-linux-arm64.tar.gz"
      sha256 "133e4088c06718f5b6ce5746a3200dbc0ae0dec6e08c10df49325b68b37aaad0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "baa3ad43a77eff2c26673b2e7a93ce142ca27541b7e04167dbcc1b027922cf7a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "7288e0af9fa48bbad08b117f8b3415b4bc1f2ada746df53a16bbb7b00b214a4d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.71.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "0399318c6833548f32e8d05e2ae3ab49a9e4133bfa3cd6b515aa6dcc09ef2aa8"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
