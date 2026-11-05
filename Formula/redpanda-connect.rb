class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.116.1"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.1/redpanda-connect_4.116.1_linux_arm64.tar.gz"
        sha256 "8029a0b84491f86c6744324900be9093b75fdff75961b1cc887796a788b37c5a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.1/redpanda-connect_4.116.1_linux_amd64.tar.gz"
        sha256 "1d174ff74a117ff0c8adf4eeb309ab1370f05d77f419bbc77f7cb7d231750c7b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.1/redpanda-connect_4.116.1_darwin_arm64.tar.gz"
        sha256 "927ebe6f2d1e816bd898049a85a6d156908b9017bacabff07740cac0acba5f0c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.1/redpanda-connect_4.116.1_darwin_amd64.tar.gz"
        sha256 "5bc8e4d2a55b2972d228a0b8f46cfb80a1ec7eb7a7f8c38f066e64c2578ee9a5"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
