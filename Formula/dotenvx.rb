class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.14.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.14.0/dotenvx-linux-arm64.tar.gz"
      sha256 "2aab9da8fc36822a56fdfa015b8c517c64a148a5bcb4d73224732fb75e3bcade"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.14.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "6726c0f40e703fd860ae9a67573d0d2e6dceae3bf23a6365faaf514f25545c9c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.14.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "76ae9b1a9326d2f78a11144aefaf6d343ef888958057c430bb7b84fffbacfe82"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.14.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "ce9da5ae19f80f0e54efe3b7dc8760bdbe8246eb80391819adf5e07a3099514e"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
