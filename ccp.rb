class Ccp < Formula
  desc "Chat Copy Protocol written in Rust"
  homepage "https://github.com/mvrpl/ccp"
  version "0.1.1"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.1/ccp-linux-arm64"
      sha256 "904724c5740e4396dadeafdbe224199086443db8b78c9cead1480c6ae7b41906"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.1/ccp-linux-amd64"
      sha256 "19010e9ae261b2ac2b16eb7055cf952f44cd19fd00547c7c1f41376c5a4ea272"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.1/ccp-darwin-arm64"
      sha256 "d1e55cac3490fb6002a73d5e0a9b7ab6d5f2c17dcdd9f2565251e0b7b8f18519"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.1/ccp-darwin-amd64"
      sha256 "0cc1c88fb3062fb2efc9625278e68dbcc98c9049139c044e777fa245e65c890b"
    end
  end

  def install
    if OS.linux?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "ccp-linux-arm64"  => "ccp"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "ccp-linux-amd64"  => "ccp"
      end
    end
  
    if OS.mac?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "ccp-darwin-arm64"  => "ccp"
      end
  
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "ccp-darwin-amd64"  => "ccp"
      end
    end
  end
end
