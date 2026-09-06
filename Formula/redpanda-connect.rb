class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.108.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.108.0/redpanda-connect_4.108.0_linux_arm64.tar.gz"
        sha256 "d094be0f905e4bebbb155d048f130bb93484ef33c17fe614c584116b0da28699"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.108.0/redpanda-connect_4.108.0_linux_amd64.tar.gz"
        sha256 "b43d919e8cb5cf64f0bed37f1067218ed585515d8700147c8b4cfc8775c9cc4f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.108.0/redpanda-connect_4.108.0_darwin_arm64.tar.gz"
        sha256 "68e4eaca9dee7a5661f43a7f505993ed5247d0259757820d0eef99ef5b5ad75a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.108.0/redpanda-connect_4.108.0_darwin_amd64.tar.gz"
        sha256 "8da78bd9fe754b2ee00e592de8ea5d75a6faf3ffdeb09e73b4d92bdab9af5930"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
