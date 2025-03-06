class FabricAi < Formula
  desc "Fabric is an open-source framework for augmenting humans using AI"
  homepage "https://github.com/danielmiessler/fabric"
  version "1.4.149"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.149/fabric-linux-arm64"
      sha256 "fcf7c3982717f50be69a505180d259b4517d5ccc9f6d8732899e0beecd346f2c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.149/fabric-linux-amd64"
      sha256 "658d5435473acebf4c9b7ee6df9376494dfc19ecc484c2291298477abe4fc121"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.149/fabric-darwin-arm64"
      sha256 "65368c06303479b5d8c81f2094a9d10b8515602ea99abd8549526ec10f47f7e0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.149/fabric-darwin-amd64"
      sha256 "fcf7c3982717f50be69a505180d259b4517d5ccc9f6d8732899e0beecd346f2c"
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
