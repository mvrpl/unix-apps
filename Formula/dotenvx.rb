class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.32.4"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.4/dotenvx-linux-arm64.tar.gz"
      sha256 "6c9126cebaf7895cca91e5902eed05e310d619c157735ae17b2b96d6d05f3a57"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.4/dotenvx-linux-x86_64.tar.gz"
      sha256 "887992850366473e9132385cac4eeb7516aa3e9526db2d92a3f27412f3440482"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.4/dotenvx-darwin-arm64.tar.gz"
      sha256 "b7b338993bdf74ba19965d5f0eb6362886cf3057f1a659012a9af331fcecf8e5"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.32.4/dotenvx-darwin-x86_64.tar.gz"
      sha256 "b13c8abddf63808290653ebdd89fd67d2df4dc5a8423e9f222bb7ae9c86e94f3"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
