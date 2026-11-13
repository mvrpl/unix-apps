class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.118.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.118.0/redpanda-connect_4.118.0_linux_arm64.tar.gz"
        sha256 "5e820785602d0be49c4ee53ff5f91d81e70ef72f81648b63c808fed26be166e4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.118.0/redpanda-connect_4.118.0_linux_amd64.tar.gz"
        sha256 "dc229726f97a8576ef08de893e9db4fbc4f5e999dd2bb8fb2a4830008cc0f9e4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.118.0/redpanda-connect_4.118.0_darwin_arm64.tar.gz"
        sha256 "bfeec88509f890d46bc5e6e6c0706b0d79991e9ba087334f0d1159b05d84b3f2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.118.0/redpanda-connect_4.118.0_darwin_amd64.tar.gz"
        sha256 "6074f11c359e4bab56a46bf85aee82ff5c4b6b21f017ec3ca6a09d01a3c59957"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
