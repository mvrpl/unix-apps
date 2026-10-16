class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.114.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.114.0/redpanda-connect_4.114.0_linux_arm64.tar.gz"
        sha256 "30d01e69be04488595c1a91342fd353a47c9d7d0e4b1b1693cd0a9b9427fba81"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.114.0/redpanda-connect_4.114.0_linux_amd64.tar.gz"
        sha256 "fdf47e8ecdc35c0f6bde7f3884d3bb2f99c0df89bbb2c0e3ea2787aba7ee3c10"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.114.0/redpanda-connect_4.114.0_darwin_arm64.tar.gz"
        sha256 "0b3462d2a53202abbeafe6e7a117d2d078be8227c9245c092008f937fdd4ed71"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.114.0/redpanda-connect_4.114.0_darwin_amd64.tar.gz"
        sha256 "bbb658c40711b7dc37a258d6cb110a6b0ae4d0bc61c93c38c045e01b091f2edf"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
