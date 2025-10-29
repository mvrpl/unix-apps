class HyperledgerFabricCa < Formula
  desc "Hyperledger Fabric Certificate Authority Server and Client"
  homepage "https://github.com/hyperledger/fabric-ca"
  version "1.5.15"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric-ca/releases/download/v1.5.15/hyperledger-fabric-ca-linux-arm64-1.5.15.tar.gz"
      sha256 "250f0666c54c419c29ebd4283310d475ccf7f778af36bb396c07b20bd416600a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric-ca/releases/download/v1.5.15/hyperledger-fabric-ca-linux-amd64-1.5.15.tar.gz"
      sha256 "a4831c233ab7c1d9e039dc5badf4cf890719358442b5042f12d94b1d6f919289"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric-ca/releases/download/v1.5.15/hyperledger-fabric-ca-darwin-arm64-1.5.15.tar.gz"
      sha256 "e8c9edc85ee6e31d83f67c85fcde05410b86119286b5658d28a9d92a659d7c5b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric-ca/releases/download/v1.5.15/hyperledger-fabric-ca-darwin-amd64-1.5.15.tar.gz"
      sha256 "e90958e1613f45079e8c26a35ca6a6290f0460bafbd44c9cf65b738f5f59508d"
    end
  end

  def install
    system "ls -lR ."
    bin.install "./bin/fabric-ca-client" => "fabric-ca-client"
    bin.install "./bin/fabric-ca-server" => "fabric-ca-server"
  end
end
