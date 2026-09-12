class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.24.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.1/dotenvx-linux-arm64.tar.gz"
      sha256 "1dfa605a8d75331cca6ff0ecea71ec100d6232e581036f6b8387abf87602665c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "d9d71595d0a0555265918de58f919a4ef1c33c2e7f0a34f5f75581a8573745ba"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "a9d29343609442c138b22f62b21b4c0504c8a77da5c6a8a0556f25651500b694"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.24.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "d657ddfd68e7f6f6a59f1dea9c5eca82749ffd7800f1ddcdb1532ab5dccd0ea2"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
