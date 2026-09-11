class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.109.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.109.0/redpanda-connect_4.109.0_linux_arm64.tar.gz"
        sha256 "780b29006370366f6aed22672c3ac5702b2f69e9641e789eda3bdc1b33a8f624"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.109.0/redpanda-connect_4.109.0_linux_amd64.tar.gz"
        sha256 "b73c40bf7ebe6acf690d38aa50c57deec5c754dc08d1a85091679b663eab9f4a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.109.0/redpanda-connect_4.109.0_darwin_arm64.tar.gz"
        sha256 "b1dba90ed88e05bc964cb2bec384294561a29cda41c3754c57d2a276be68a3c6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.109.0/redpanda-connect_4.109.0_darwin_amd64.tar.gz"
        sha256 "bf34a3e23ec53b5655e750a27aebbe2b66bbd4c0dcbf21c7c62dca7d9199a6fc"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
