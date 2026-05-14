class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.65.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.3/dotenvx-linux-arm64.tar.gz"
      sha256 "c63dbbde1f2890143c2cf57871c9fbe95bf24213707554a65b8fce73cf117e25"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "96aa6e4d4b94eed68d2a27118367865c304f803b65aedb9e6e31267c0b98d4ab"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "b61d305594de72bb34ebf9bd160fe6d41d4f833ce3297ead467a9fb5ac161e46"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.65.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "15eb7d1476c4005c4434c7286deafe8e222bdd3ab1f3fc2dc6e710101caffc08"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
