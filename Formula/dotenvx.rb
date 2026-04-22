class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.61.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.3/dotenvx-linux-arm64.tar.gz"
      sha256 "4f42849557ea877621684377ff96dd33501911b32fa7506911f949a868b750a3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "61c366fa7f252f1617b8136b417cb952f3ff42b9bfef97823ef2f91d8a6c639d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "bc7702326e7ef51468b993e1a311df5382afa828026168d645a21bd43f002b4b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "5893d1d62e23a457977ccf4b24783d9eab4666d895f6b631046227fd043b9a53"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
