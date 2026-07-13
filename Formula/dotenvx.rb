class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.7.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.2/dotenvx-linux-arm64.tar.gz"
      sha256 "85ab4aced66114383a0b6f57cc99a63533d6faf9458fb04e21ea926484017fe8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "6732fbf23351b8bdfd0a7f17b899d73e4a5ecf0f6d4d98bf11d4f9fd2aa1543c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "0f6ea36bf6818014b2c429a7fd88f3f6c09ae31c0dadbed47e377199c98ee17e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "66571256b44bbe819f4d85504920360b00ff92b22d6f7e56604e2917e348ba6b"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
