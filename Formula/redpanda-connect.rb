class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.116.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.0/redpanda-connect_4.116.0_linux_arm64.tar.gz"
        sha256 "0d6f2a698806d9168feeae4a6a3c7ca9bba7f2110d5f4bc0ac78716a6e133af4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.0/redpanda-connect_4.116.0_linux_amd64.tar.gz"
        sha256 "ebc6345761ce9eb7da3f4915b416d2b0192a300c0c0b4166a19b10b0c7bbcbb4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.0/redpanda-connect_4.116.0_darwin_arm64.tar.gz"
        sha256 "ecb3fd9eccd7f45fe2fc372ac452c12f7f8eb2e170d24775e3be0f6b2ed80d9d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.116.0/redpanda-connect_4.116.0_darwin_amd64.tar.gz"
        sha256 "1196b8c85ad43def930067cf9a82f6993efedd6560ae9fc613454daa8fff46f5"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
