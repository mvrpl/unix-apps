class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.12.2"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.2/screego_1.12.2_linux_arm64.tar.gz"
      sha256 "2043ab3f011b63b7a3bf3cb884f1385d51da1dbb1ec5cb89a7c2c905702b79e5"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.2/screego_1.12.2_linux_amd64.tar.gz"
      sha256 "ac9e2b447729e3c6ef1260b64f1017acf1f1a8df4a2c7ad58442fd10ecb0bb1a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.2/screego_1.12.2_darwin_arm64.tar.gz"
      sha256 "d7609aee3c963b4a5e2edb2dc5d0c07e041457653c894fa4f26cde49147501a2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.2/screego_1.12.2_darwin_amd64.tar.gz"
      sha256 "499c72786bea983247041496dddf26c816c6a38f376cd014bbbdfb0d5a17d7df"
    end
  end

  def install
    bin.install "screego"
  end
end
