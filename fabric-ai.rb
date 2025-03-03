class FabricAi < Formula
  desc "Fabric is an open-source framework for augmenting humans using AI"
  homepage "https://github.com/danielmiessler/fabric"
  version "1.4.147"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.147/fabric-linux-arm64"
      sha256 "68dd30162461ea28b0ed752f51273b20849101b1e3f3a6ca9fbc15aec67a308d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.147/fabric-linux-amd64"
      sha256 "9150376dd0da891f8fa2665d798e1f2fc946c8265dff78caff93fc4c61e355ea"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.147/fabric-darwin-arm64"
      sha256 "2eb49e68264f570ef0618f06c212417e1578d6304ca5c3c10e0183a86d865cc5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/danielmiessler/fabric/releases/download/v1.4.147/fabric-darwin-amd64"
      sha256 "22a7ff59d382a868272478a4147b26d1e836c8a7377843075c447284ea4d95f7"
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
