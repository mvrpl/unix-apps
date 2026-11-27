class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.120.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.120.0/redpanda-connect_4.120.0_linux_arm64.tar.gz"
        sha256 "e0457a05e026ffe470a0b91dcda2b45b185206f28291ba78339fbf31d49e4846"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.120.0/redpanda-connect_4.120.0_linux_amd64.tar.gz"
        sha256 "122ef832257394e035a89a28e1331310b0c1b08ed8c5a4e7f98e9bcb8ea62926"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.120.0/redpanda-connect_4.120.0_darwin_arm64.tar.gz"
        sha256 "784ca3e55599ead223ffac80499f7708e82f5a85abf61be3d53ae7669ae69bba"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.120.0/redpanda-connect_4.120.0_darwin_amd64.tar.gz"
        sha256 "b4bbe2af6d1a0553b008c65e5622e35a031f07d1164ba64dac54649f56f50630"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
