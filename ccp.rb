class Ccp < Formula
  desc "Chat Copy Protocol written in Rust"
  homepage "https://github.com/mvrpl/ccp"
  version "0.1.3"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.3/ccp-linux-arm64"
      sha256 "6123c5b6a4bd48480f08911de5f3d375c837692f42745d8a770a145e06437989"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.3/ccp-linux-amd64"
      sha256 "2370fa6da8b04bf9e57925d65bbc57b4c503fcb7278a85d46ebbe6f75cb1c263"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.3/ccp-darwin-arm64"
      sha256 "8f90306d651c33419aeef25a66f45f720d7c042d91fb03459b6ba80398a0307c"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/ccp/releases/download/0.1.3/ccp-darwin-amd64"
      sha256 "9e8ebaafd6b59feba6a562a6893d471ada41cdd50c4bb54cf64aa188269f1c00"
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
