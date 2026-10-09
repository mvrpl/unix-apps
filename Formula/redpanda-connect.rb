class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.113.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.0/redpanda-connect_4.113.0_linux_arm64.tar.gz"
        sha256 "975526db736d128f614306d4f50028fa61d6913d353cb6645b779b15254e2b32"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.0/redpanda-connect_4.113.0_linux_amd64.tar.gz"
        sha256 "28c1c0cc41d72a98053549862b452b8b1090f8bbca5042653113ae489a208b5a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.0/redpanda-connect_4.113.0_darwin_arm64.tar.gz"
        sha256 "28f3782054a1bb894f16486fcd197f52a07346a28d5abc694c5aae905db542c1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.113.0/redpanda-connect_4.113.0_darwin_amd64.tar.gz"
        sha256 "0ed6dcd071962847c578e02c0f394adc6fce91ebcc1e49298a9b4415207f794b"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
