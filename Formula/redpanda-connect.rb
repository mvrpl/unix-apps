class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.112.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.112.0/redpanda-connect_4.112.0_linux_arm64.tar.gz"
        sha256 "d8145ba1a85a6eda9511545637d10ea35c66cec004fedcb3ea5dc81fc240d45c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.112.0/redpanda-connect_4.112.0_linux_amd64.tar.gz"
        sha256 "d7615f24ecacedaee88cd41583e9895bc936df57f230d2ae5383c03a81e10d26"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.112.0/redpanda-connect_4.112.0_darwin_arm64.tar.gz"
        sha256 "fca5aca68cb83f9d98b3703c2e691f6f8605c4db6b1d517c6efd6e31050a2585"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.112.0/redpanda-connect_4.112.0_darwin_amd64.tar.gz"
        sha256 "6069f8065a5f2e30f2b7ea9602e61be42e3d098b4d3fbfac74158f84a977fa2b"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
