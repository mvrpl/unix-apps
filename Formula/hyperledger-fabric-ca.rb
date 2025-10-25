class HyperledgerFabricCa < Formula
  desc "Certificate Authority for Hyperledger Fabric"
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
      sha256 "673deb2e05d97fe428d824e3ab1b3fadd04e97e3727d09cbbbfbbf6b686810e2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric-ca/releases/download/v1.5.15/hyperledger-fabric-ca-linux-amd64-1.5.15.tar.gz"
      sha256 "b823d48017fece94d1de5fa1d886041a629684fe86a7fa19525c56ef3002ab03"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric-ca/releases/download/v1.5.15/hyperledger-fabric-ca-darwin-arm64-1.5.15.tar.gz"
      sha256 "921c0cee93606797abf9fc366a980e2f6346e79de0e3c4d4c68fd16abc513e01"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/hyperledger/fabric-ca/releases/download/v1.5.15/hyperledger-fabric-ca-darwin-amd64-1.5.15.tar.gz"
      sha256 "a83586a29f6380f620dfcb7abeb338ed32c31c7cab9962b568dc767fa5fe0232"
    end
  end

  def install
    bin.install Dir["./bin/*"]
  end
end
