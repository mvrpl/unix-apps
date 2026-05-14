class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.12.4"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.4/screego_1.12.4_linux_arm64.tar.gz"
      sha256 "47026d78cd0a8bd1f039a899a0b4015b4e0ead2b513e9caa6cd2e3c11f135810"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.4/screego_1.12.4_linux_amd64.tar.gz"
      sha256 "f7dc5ee1f32cec7691cb5c51d9dd9b618cfdda25e7fe59360b6014e308cbb652"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.4/screego_1.12.4_darwin_arm64.tar.gz"
      sha256 "2ecfdcd3e1f41ffc51ffd15eb2c30563be0ac3c39526846306b19e7388a17cc0"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.4/screego_1.12.4_darwin_amd64.tar.gz"
      sha256 "711658a1bdc4db9c84b1123c3811f8295dd56f7a5c8f4870c42c9db672f082a2"
    end
  end

  def install
    bin.install "screego"
  end
end
