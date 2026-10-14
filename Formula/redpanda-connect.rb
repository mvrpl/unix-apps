class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.113.1"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.1/redpanda-connect_4.113.1_linux_arm64.tar.gz"
        sha256 "f3f0f5a87be587beb5833142c6ad33bd995345f9a0f8cb1f93f3132b7dfccd7d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.1/redpanda-connect_4.113.1_linux_amd64.tar.gz"
        sha256 "2a8efc4014853f2c43c019fd75d53743841c3859329189caedd2eda752365544"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.1/redpanda-connect_4.113.1_darwin_arm64.tar.gz"
        sha256 "da845c04a7780525841a8a4b430c06ac8d071257142b92f85b6a9132bf349dbc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.1/redpanda-connect_4.113.1_darwin_amd64.tar.gz"
        sha256 "2ca07633ec2d3ea2722e118cc1a72e86f9566045a7da76a00aff9a9ff56921c3"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
