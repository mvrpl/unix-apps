class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.60.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.0/dotenvx-linux-arm64.tar.gz"
      sha256 "b25e83ec3fb4360948ffb6ab176055e30ec6a383402f43ac52d31f65bded8b59"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "39efb9128e281b08aadd00fbfd9e746c9854108cce0765b242656b6148e29c73"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "2363b8029768ebf81f94b6b381c9e3440c6ef735d037dcf11a1380d44b113658"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "efdc4716132721e3e3e3dc8cac18919713e3323466237b91575eabfb704be954"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
