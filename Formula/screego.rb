class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.12.5"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.5/screego_1.12.5_linux_arm64.tar.gz"
      sha256 "e47383e6c9adb96b4226772cd59f78d823a320b4553d0a79b262e54bd724980e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.5/screego_1.12.5_linux_amd64.tar.gz"
      sha256 "60e69336ec69c0091a988b7f6fb299aeae752b10f24abad4c34d35282ac4fb4a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.5/screego_1.12.5_darwin_arm64.tar.gz"
      sha256 "1c65908d620ce5d5f0efd0bd4aad28062853c50a9292fb52d5f2ca4a5f486800"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.12.5/screego_1.12.5_darwin_amd64.tar.gz"
      sha256 "8d48cda160acdb7dbc48b93277595c2e24d7ce419d3d0d73bf205d7cb782eb39"
    end
  end

  def install
    bin.install "screego"
  end
end
