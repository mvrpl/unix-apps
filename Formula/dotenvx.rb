class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.37.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.37.0/dotenvx-linux-arm64.tar.gz"
      sha256 "e3d69c1428267b308bb90d701b17375b67ca2505b3dbf0a0bfd82cb80c6de3b8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.37.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "611b1df8733b3fe9e1c89e94b49d0495c5fda30b3a319722da5e80cc7ac08b79"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.37.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "01f2f66252c7a0807bbf55106111923acf0dd394cfc0ab93cb65654578496c30"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.37.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "89e90568dbb6fcba42e141c18ec543a9a62bdfc92d23440c58898bf6e131aece"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
