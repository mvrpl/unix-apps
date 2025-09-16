class Lassie < Formula
  desc "A minimal universal retrieval client library for IPFS and Filecoin"
  homepage "https://github.com/filecoin-project/lassie"
  version "0.24.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/filecoin-project/lassie/releases/download/v0.24.0/lassie_0.24.0_linux_arm64.tar.gz"
      sha256 "b55acacaf4c88ced24c854e5e9b202d249a94a26e27b0fbb1954841f33bdb386"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/filecoin-project/lassie/releases/download/v0.24.0/lassie_0.24.0_linux_amd64.tar.gz"
      sha256 "ababb16d2e9c7c926b97f78ebb7fc1e21ae0b011abc1f611cc6a9a9ae7c8fe59"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/filecoin-project/lassie/releases/download/v0.24.0/lassie_0.24.0_mac_os_all.zip"
      sha256 "317ac0e33b8df25600d5568ea92d1fd3eb8a609573cd501730f438c3e822abd6"
    end
  end

  def install
    bin.install "lassie"
  end
end
