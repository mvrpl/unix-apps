class FabricAi < Formula
  desc "Fabric is an open-source framework for augmenting humans using AI"
  homepage "https://github.com/danielmiessler/fabric"
  version "1.4.145"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.145/fabric-linux-arm64"
      sha256 "2fb9c8ddff3dc6e19e2c22ebaf1a41d3de53b90293a53be656e9428826376a56"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.145/fabric-linux-amd64"
      sha256 "36fa59f52bc3a9de62fa7e8e2a786b43adb2acec8aa2716c23cf90d0f6f6a9dc"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.145/fabric-darwin-arm64"
      sha256 "d9913e77abc2c3f9689c6cf0abd3f0b53402efb6267d78fb7078bfb8aedd10e6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.145/fabric-darwin-amd64"
      sha256 "5e226f107f4a8f3f486fa0f5e02a96c944bc2bda549bae94b71bed632d2a8e9c"
    end
  end

  def install
    if OS.linux?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "fabric-linux-arm64" => "fabric"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "fabric-linux-amd64" => "fabric"
      end
    end
  
    if OS.mac?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "fabric-darwin-arm64" => "fabric"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "fabric-darwin-amd64" => "fabric"
      end
    end
  end
end
