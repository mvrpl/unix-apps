class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.117.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.117.0/redpanda-connect_4.117.0_linux_arm64.tar.gz"
        sha256 "d602d1cc7e851cc51eb407412ed93a2d500b1a03770ebfe56017328c6dd79b3e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.117.0/redpanda-connect_4.117.0_linux_amd64.tar.gz"
        sha256 "811940ba2b24224ef8bd06d8495ea07380545dad4ad4a5785e04568aaf74b0e3"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.117.0/redpanda-connect_4.117.0_darwin_arm64.tar.gz"
        sha256 "7c97817f4173542ba86d5acf19de942d48ad4921f49c58aec5b22db3ecde778d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.117.0/redpanda-connect_4.117.0_darwin_amd64.tar.gz"
        sha256 "fe2dd76687f2569bd2e13d2ede353d27df267c3e6178cdaf888df946d13835a6"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
