class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.51.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.2/dotenvx-linux-arm64.tar.gz"
      sha256 "bb800125867048009b8836adacbb5248ebc4c1f583c9c57e1dc916f72ebb6a94"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "4fc6cc4fbce693fde6dfbdc7e5fa4b64ec181e04bc15207f0fc363683ab13e6d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "2b5bcd89d534e84a282022007716f5d390b1111e9fbfe2d07f08b6adbed57465"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.51.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "74788919ac5ca1641098d2632642fc10fb8d0f40f513d98d4dbd684ebabe25a2"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
