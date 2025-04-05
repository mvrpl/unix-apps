class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.11.2"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.2/screego_1.11.2_linux_arm64.tar.gz"
      sha256 "423099a3839284c66613f799ae5591823400bf44d9402a89d3267a7ebcc0d02e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.2/screego_1.11.2_linux_amd64.tar.gz"
      sha256 "2733a1e59442f7aa272e0e55f4d2366a8e201d0af4021a9bd7e9f6176e4644b5"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.2/screego_1.11.2_darwin_arm64.tar.gz"
      sha256 "7983f3d2a138853d2b9c220c9caa220d4e48deb2daad21663f5054a1366c3a8b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.2/screego_1.11.2_darwin_amd64.tar.gz"
      sha256 "8fab54e2aab814b1fdf792cc951bac41e89391427c7f69981c73236693cc7c6b"
    end
  end

  def install
    bin.install "screego"
  end
end
