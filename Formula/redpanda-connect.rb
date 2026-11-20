class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.119.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.119.0/redpanda-connect_4.119.0_linux_arm64.tar.gz"
        sha256 "70aeabb9faeb9d8850428c4b3edc106de8597e9a20a8aa868d54cb7526437acc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.119.0/redpanda-connect_4.119.0_linux_amd64.tar.gz"
        sha256 "def9a5b888b8f6134eef90138c4e42bc5cab022ff77dc7f37aac36b87e213c9b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.119.0/redpanda-connect_4.119.0_darwin_arm64.tar.gz"
        sha256 "7548748a511cff71cb662acd73dfacb0cbc36c0b5c88b28af98f3a1f24055c91"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.119.0/redpanda-connect_4.119.0_darwin_amd64.tar.gz"
        sha256 "6e3a8c0cdda61e24a45f41be8d0d67b2940c43b85fa2a7d2b14490b9a9d15e37"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
