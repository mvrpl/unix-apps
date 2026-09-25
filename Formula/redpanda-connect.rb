class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.111.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.0/redpanda-connect_4.111.0_linux_arm64.tar.gz"
        sha256 "4f8e0ca116130bccc604566002da9272c2c5c771920459827b9bbc92eaf03f23"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.0/redpanda-connect_4.111.0_linux_amd64.tar.gz"
        sha256 "0c533469fc306e94b0f43a06e5ab72feb5bf3c3202662704f3375677d9e1d756"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.0/redpanda-connect_4.111.0_darwin_arm64.tar.gz"
        sha256 "36208b8b653c5fc54e0bc848c0e935569e9a484f3112a1a42f4a1a98e3161a84"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.0/redpanda-connect_4.111.0_darwin_amd64.tar.gz"
        sha256 "62fd282bbec121a253245aef8ad863248290ac9b9b041bc10c6c2abb5c69a06a"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
