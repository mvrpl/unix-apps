class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.8.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.8.0/dotenvx-linux-arm64.tar.gz"
      sha256 "62e8db8b2268c217ebb1533587813593c539e51bbe1d1e710817f070bdd099fa"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.8.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "3b6e5c2a032d30012bb12deb3968b12c8056709355bd16340090f90235e5c7d4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.8.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "338f862ed7996efbc2ba34d928752aa4c77a7e8f22987c53add65909232bc11e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.8.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "44dd2b7b70b6dfa5c9039fbf3ab5758714c163a9a8e56759e24ea897939d8c44"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
