class FabricAi < Formula
  desc "Fabric is an open-source framework for augmenting humans using AI"
  homepage "https://github.com/danielmiessler/fabric"
  version "1.4.142"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.142/fabric-linux-arm64"
      sha256 "c892129edca2cb9fa2bdfca482dbcde689bf37e5d95bfc54667c46120b98955d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.142/fabric-linux-amd64"
      sha256 "22d3e52aaa990e4717308a48d5094085925afc6bb892cf350532c2e734252200"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.142/fabric-darwin-arm64"
      sha256 "fde017d92d7854226d6573ca66678d9ff743c1dfd5e4f01f39d2f6534d354cc6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.142/fabric-darwin-amd64"
      sha256 "8efaad83c986d70469b272c09f2e790d5a2cf5b9b1f9af0d6bf5f6a1bdc0042e"
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
