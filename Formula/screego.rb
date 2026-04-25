class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.12.3"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.3/screego_1.12.3_linux_arm64.tar.gz"
      sha256 "e3e183bcd76e78bfc23891fde33bd31ea8c7c368a066adf39fd6a90f7b834e12"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.3/screego_1.12.3_linux_amd64.tar.gz"
      sha256 "5985c4f6da4bc6132a369e8a1f20f309d533e2664a2d89b0b8811928e6600847"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.3/screego_1.12.3_darwin_arm64.tar.gz"
      sha256 "3b5044b337bc4dfa47c32f37d40ee4f5ccfc437f38ba91bcfb510cee8f8a14c3"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.3/screego_1.12.3_darwin_amd64.tar.gz"
      sha256 "ec5676058aeaa0520bddef8e374f452d0b400c5f06c9b61a6b0467a1f86fe25c"
    end
  end

  def install
    bin.install "screego"
  end
end
