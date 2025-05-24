class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.12.0"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.0/screego_1.12.0_linux_arm64.tar.gz"
      sha256 "13c1ce5883e3a0e8a78a2f04c71e072f54e3d4ca660b488c60b8ab0a8a16b305"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.0/screego_1.12.0_linux_amd64.tar.gz"
      sha256 "9d64dc099ad150a362c0337901da9e0c27d5b8dc386bd1fc3610de2e78a93baa"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.0/screego_1.12.0_darwin_arm64.tar.gz"
      sha256 "bb0612274d59cecd1971af2014188b61d9532b04e03dfb618e685f09cea169b8"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.0/screego_1.12.0_darwin_amd64.tar.gz"
      sha256 "3234704434334c7e40ff3bb8153c111a502065589d6af39e97c550bcaa3bce16"
    end
  end

  def install
    bin.install "screego"
  end
end
