class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.115.1"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.1/redpanda-connect_4.115.1_linux_arm64.tar.gz"
        sha256 "39eef1c8e56b1b84356ae6c7200b537e8bc14baef401071b54fb2b68c9a3d520"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.1/redpanda-connect_4.115.1_linux_amd64.tar.gz"
        sha256 "f02b53d10e3ef135c49a84278b03b1c05b36d857175402e10d51a7e23771e583"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.1/redpanda-connect_4.115.1_darwin_arm64.tar.gz"
        sha256 "a935483e85ef49da8b2061418b6503f928c92c57a1792a37768eb4d0bd82a3d2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.1/redpanda-connect_4.115.1_darwin_amd64.tar.gz"
        sha256 "7fea2638b1cc4ccdb6d02f213b1947bc1dc12e523dc9ef1deb98ba52c14460bc"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
