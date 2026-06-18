class HyperledgerFabric < Formula
  desc "Hyperledger Fabric is an enterprise-grade permissioned distributed ledger framework for developing solutions and applications"
  homepage "https://github.com/hyperledger/fabric"
  version "3.1.5"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.5/hyperledger-fabric-linux-arm64-3.1.5.tar.gz"
      sha256 "4a42cad740a7e0373eda6bf1e27c86e9b06132f9bb751daf7f0f7dc1d1bbfed9"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.5/hyperledger-fabric-linux-amd64-3.1.5.tar.gz"
      sha256 "b9c31fd490991e76f8acb1835dee09fc19fee5428cb13e190ee6e0bdd2c37858"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.5/hyperledger-fabric-darwin-arm64-3.1.5.tar.gz"
      sha256 "d67a5c3366746a984f8ee9ae0ebf5c8b357c9d33dd589fa0b7668d739472cef0"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric/releases/download/v3.1.5/hyperledger-fabric-darwin-amd64-3.1.5.tar.gz"
      sha256 "866b64b036ba9eff51ba2131bbe34b4b9057192f5766859ede22ea1cdd564158"
    end
  end

  def install
    bin.install Dir["./bin/*"]
  end
end
