class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.3.4"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.4/dotenvx-linux-arm64.tar.gz"
      sha256 "3d468baca91be187823d3a4a66ba5b0ad52c695ea7c9dd8b8f69b3124f640fe4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.4/dotenvx-linux-x86_64.tar.gz"
      sha256 "b06ed1417ff23214c804e9f01343d845d383db32b24e229caaad71a725deaa6b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.4/dotenvx-darwin-arm64.tar.gz"
      sha256 "c3427e99fd47e0dede3c3409bc1e0ec38edca9849e52de217b94a276272c415e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.3.4/dotenvx-darwin-x86_64.tar.gz"
      sha256 "6002c0062121821d5ec91d2bfa5b8b909a253904a4568b773bafbb4ba2b1036b"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
