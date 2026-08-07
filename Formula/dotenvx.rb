class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.20.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.20.1/dotenvx-linux-arm64.tar.gz"
      sha256 "956c9fd2d34d2271c748ea23ea34fb4b6083ebd40fd2222fb73f4861e022c4fe"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.20.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "d0adef6ebc4e5707da24c35af4901e9a345f1aab52e6d7ec0556059374e3a1ec"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.20.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "36d7778c339020ce3332d983b979243b70b73c6f2ceca5a2dd2933a980883c97"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.20.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "77962d4c2e4d7be15d8da4fbd1ff25ee4e6fa75a0ac45f1e989318db200b9e53"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
