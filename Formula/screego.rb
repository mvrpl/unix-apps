class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.12.6"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.6/screego_1.12.6_linux_arm64.tar.gz"
      sha256 "a3b1b0bfc91288e49f3b49e9dea690dce93c03c5c60b7c37afd55f536f4babbc"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.6/screego_1.12.6_linux_amd64.tar.gz"
      sha256 "b54e0d1564e43c41e1bd34cf560cc19f93940cb0d919ce7213854b9c8f878780"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.6/screego_1.12.6_darwin_arm64.tar.gz"
      sha256 "6ba29e449a381ef902b868922a3078d7f1d338d56875b44158cd543738cb4279"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.6/screego_1.12.6_darwin_amd64.tar.gz"
      sha256 "d1c6a1938c96d613630a2516461cb3b63c05ac1a368c09926e21915c77938b2b"
    end
  end

  def install
    bin.install "screego"
  end
end
