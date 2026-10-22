class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.115.0"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.0/redpanda-connect_4.115.0_linux_arm64.tar.gz"
        sha256 "87fc2f9c9313557beb870425a6f8b2a65980756c0c79ae0d3619927b98d15312"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.0/redpanda-connect_4.115.0_linux_amd64.tar.gz"
        sha256 "5252610ff1dbec4be172a723147170e46f234cd0a3eb3cccb18a02e7c4762e65"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.0/redpanda-connect_4.115.0_darwin_arm64.tar.gz"
        sha256 "294c52dbf77bc4a6734e734b4ef70eeac017c1afecf7b739037ba58defcacbd0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.115.0/redpanda-connect_4.115.0_darwin_amd64.tar.gz"
        sha256 "df81a834f22fd08f2147340e7bc961aeacbf25802b2e4deb759435c270bb5a59"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
