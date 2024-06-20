class Ccp < Formula
  desc "Chat Copy Protocol written in Rust"
  homepage "https://github.com/mvrpl/ccp"
  version "0.1.2"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.2/ccp-linux-arm64"
      sha256 "e3de7f43f76f2dd41b003fb585f5b11336288a5ff0f8bbc3a5640a0c3b8ef7b0"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.2/ccp-linux-amd64"
      sha256 "b6df180cd11d8966e29415448753f6baea0d35b2ed06a924bc14260791247a25"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.2/ccp-darwin-arm64"
      sha256 "441860e6fbd603de735f915fe6c5f8c19348581c54020f513958b12b25807031"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.2/ccp-darwin-amd64"
      sha256 "67d1998eefbce2c0c666516522c936f79c2c97fa7238d44aca439dd90c0ff962"
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
