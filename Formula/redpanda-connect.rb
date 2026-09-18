class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.110.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.110.0/redpanda-connect_4.110.0_linux_arm64.tar.gz"
        sha256 "71a9049aa6e05205572b5055ba0ce3f21d7e7c650b85afff65db905a88d6a981"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.110.0/redpanda-connect_4.110.0_linux_amd64.tar.gz"
        sha256 "5da1b9b2e4f008d55ee4ef66168fe02f86a5969a56e84bfee671631a6e0ebfa4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.110.0/redpanda-connect_4.110.0_darwin_arm64.tar.gz"
        sha256 "c2dec3030014e865d8756432a9bfc84707c434590c805538ad7d8e702e651796"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.110.0/redpanda-connect_4.110.0_darwin_amd64.tar.gz"
        sha256 "06ddda3dcae1c44ab2b7a7473b4cac6afce1b37c6387d350c6ebfd02f8a38d4b"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
