class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.18.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.1/dotenvx-linux-arm64.tar.gz"
      sha256 "ac4790e4dafeff098e3a8afdf03ff894ced60402e802ab741dd6c289ba023413"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "eca89fcd68db79afaf18c85bcb9982103cd1bf88f28278cf9a5f42a037c601ba"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "6d3aa41e5e985c467a67c22f8f34c3116140862d924434da36984379ae103795"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.18.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "2aab163d2dda08d5fa85e0ceb922e9398542a996f518116a28e0fb7472186cec"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
