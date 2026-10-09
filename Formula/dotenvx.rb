class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.34.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.2/dotenvx-linux-arm64.tar.gz"
      sha256 "da075d7b946c502902868522091cdd9b31c868ad1c46a46cea271f9f05c0d129"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "1f3426ddd44f8a0505d058989d768ca8cf2c3ba56de8f1b5c2ff5ade2525bc30"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "d5fd1b9cb722eb2a73f8358cf6aa9c56f0c78544d106a4c954b419bcfbeafb7b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.34.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "0f89969899e567af1364e31562e57d174f32ab5c194e10c9ceb61c03d21de405"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
