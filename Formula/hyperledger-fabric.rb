class HyperledgerFabric < Formula
  desc "Hyperledger Fabric is an enterprise-grade permissioned distributed ledger framework for developing solutions and applications"
  homepage "https://github.com/hyperledger/fabric"
  version "3.1.4"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.4/hyperledger-fabric-linux-arm64-3.1.4.tar.gz"
      sha256 "10ef1f5440a33fc5d90b88f8d0417037beeb44d67be431e6f35516e6007cfc75"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.4/hyperledger-fabric-linux-amd64-3.1.4.tar.gz"
      sha256 "9c197263d3eba0f5a0b0f5ef14d64922131e5a0fd0f94b12b20fe9d1d96ed5ed"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.4/hyperledger-fabric-darwin-arm64-3.1.4.tar.gz"
      sha256 "b7d92385c871daa405a78d8abd9edd1b7061fdf9e5246dad9b9048c1681ee6a2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.4/hyperledger-fabric-darwin-amd64-3.1.4.tar.gz"
      sha256 "54233afb606a500c6a5efadfce90dafdf7c789e8d6fbd48d4477210ab9864d65"
    end
  end

  def install
    bin.install Dir["./bin/*"]
  end
end
