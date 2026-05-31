class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.70.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.70.0/dotenvx-linux-arm64.tar.gz"
      sha256 "44bd215d84f2205ecc9f140b17f53977797867ca055a7e41cb35453d114e5291"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.70.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "461e93f376166a66e4b960f7d4512905d748148dd7c13e1e77b481a70751242c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.70.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "e0f467263e18ed5a08a8fb72a9a2d784fd810f068b17bdddd89bd73fc9357264"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.70.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "ad21e331d295c4ed47053dea2872d8b22f7b9853cbf258f2ad0a1bc36b8f7fdc"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
