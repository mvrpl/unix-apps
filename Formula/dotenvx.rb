class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.38.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.1/dotenvx-linux-arm64.tar.gz"
      sha256 "6b0bd5bd196d0bc6879113231065e50bc86485377f2ad508592b68a0dd1b3880"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "41ab386b9ccd37bddb848c74db0c7132e984bdbe2b27206fa955d542d36af874"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "b89dea0de6aab7ece330a80e30cd3a17e8ac22b24c3304a5ee51a7ae6c9f3587"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "a9386633b27b153f71100fddc7d79e05d6b5f4e7c98b69615db6892f508fa461"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
