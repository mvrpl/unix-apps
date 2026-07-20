class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.15.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.15.1/dotenvx-linux-arm64.tar.gz"
      sha256 "1e2f865f7a8ed80eba8ad0e06bd86d5f9e4627c73d9c949347a1630e681b0744"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.15.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "7f783106cdca4ac67b6c736d60a435bcae4148a235a5555fd286a2734e5096ef"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.15.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "d939b34654cfc72a037c2603e012f3c9956e5512f9a87f9e60a9c59c9952798a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.15.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "d9d317e06ac4b68bda96278aaad67aadf24eb0b97239d085ee5c9ea06c483f30"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
