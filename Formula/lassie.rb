class Lassie < Formula
  desc "A minimal universal retrieval client library for IPFS and Filecoin"
  homepage "https://github.com/filecoin-project/lassie"
  version "0.25.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/filecoin-project/lassie/releases/download/v0.25.0/lassie_0.25.0_linux_arm64.tar.gz"
      sha256 "4d51f114897e4ae87b33b8fc4232a1c7f33136c931640c8d0925e11cd0b06317"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/filecoin-project/lassie/releases/download/v0.25.0/lassie_0.25.0_linux_amd64.tar.gz"
      sha256 "cbd81ce9625a7db346a1c7f3bb67d4654fba4af0d8c5bdfdd1c0aaddd2c76286"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/filecoin-project/lassie/releases/download/v0.25.0/lassie_0.25.0_mac_os_all.zip"
      sha256 "da53e6291b63de6db9b42774c2129b005dff5d0fccf939b23bdd92877154cf39"
    end
  end

  def install
    bin.install "lassie"
  end
end
