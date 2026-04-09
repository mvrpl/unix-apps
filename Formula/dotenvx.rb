class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.61.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.0/dotenvx-linux-arm64.tar.gz"
      sha256 "082a25127493197dcd9f167ba32986e2934af999c822fb5350ceda1da228d9ba"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "447ed4ccbf72758f9325aefc48ebbc774a6e9c2503e477e68f46a7f3e0221147"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "96d857b4947f67dcedaed8d782ab0942775f0ccde41afb8eb730c757706d1523"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "394d9b3000e4bcb39291cff7d9cf15db8bcb86debf31a393a2ee38d3ae37070b"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
