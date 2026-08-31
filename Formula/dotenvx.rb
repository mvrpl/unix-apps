class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.23.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.23.0/dotenvx-linux-arm64.tar.gz"
      sha256 "6230391b05a15c493b2e5fe04256da47dc840d2fee8c4ed7d5502490df613da2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.23.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "6e37df8ed280ac560992355a5b8f2e91b6aa50993a1d566327d80754a2c8afdb"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.23.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "92ce94fda1f0a5f5755598130a2176382fb4edeb456df69f98605d36f3e77c69"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.23.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e94a11a67d8aba42ddcbf29dac2c12ae08eb706fc47c98ee69197e11dbebbd42"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
