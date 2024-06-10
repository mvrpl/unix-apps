class Ccp < Formula
  desc "Chat Copy Protocol written in Rust"
  homepage "https://github.com/mvrpl/ccp"
  version "0.1.0"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.0/ccp-linux-arm64"
      sha256 "904724c5740e4396dadeafdbe224199086443db8b78c9cead1480c6ae7b41905"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.0/ccp-linux-amd64"
      sha256 "9dc46c625150133d09dd6713b797b3d08e50a40a5dbc3c80749f2941be7da0c8"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.0/ccp-darwin-arm64"
      sha256 "9bab38a3091bbf8884ea6d5e6254179fc96ea3c3471093a962755f2c90e67636"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.0/ccp-darwin-amd64"
      sha256 "6010a9c82741b2b8c60a9f72c4576666d7a5cfb6a42421fb720d8b484f2d2bce"
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
