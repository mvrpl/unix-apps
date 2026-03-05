class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.53.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.53.0/dotenvx-linux-arm64.tar.gz"
      sha256 "a67d389568420d9b8317033a3f4ca35096a5b8921a2cb6ba24a8cd93a4eb8892"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.53.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "e1b64a74859c90bfe082aea0bb7249e9cf50704d1f17be51d6c7f14b93919d10"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.53.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "d11044a23055e2aa74b8a5bbf1eec9a431943193f6b8ccf1d491584479d9fe4e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.53.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "77e572dcc33733aa7f7d627f04f0c876cc3b2d763267f23a5bda65a07825b0b2"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
