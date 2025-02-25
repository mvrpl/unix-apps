class FabricAi < Formula
  desc "Fabric is an open-source framework for augmenting humans using AI"
  homepage "https://github.com/danielmiessler/fabric"
  version "1.4.138"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.138/fabric-linux-arm64"
      sha256 "4943851178cfe885a7e875d1a266e4d682bba6b508360c07d4f59af32e0a8d61"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.138/fabric-linux-amd64"
      sha256 "a529960cf9c303c3bc4e4422013cad0298350a4532a28b25a51e7aad08921a72"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.138/fabric-darwin-arm64"
      sha256 "abe823878c80e0ed611e7f981264ba5b4be52f612da2bb6dceaca2e63c8bcff1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.138/fabric-darwin-amd64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
