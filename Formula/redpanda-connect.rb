class RedpandaConnect < Formula
  desc "Fancy stream processing made operationally mundane"
  homepage "https://docs.redpanda.com/redpanda-connect"
  version "4.111.1"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/redpanda-data/connect'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.1/redpanda-connect_4.111.1_linux_arm64.tar.gz"
        sha256 "523ddddf05de103a1c8c9640fbde2cc5449462d6b2604b1cef1f03e94f0d8607"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.1/redpanda-connect_4.111.1_linux_amd64.tar.gz"
        sha256 "af0196dd12dc6dbd531b8f85a304f51c292dd5461e203f307a8785c487a2811e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.1/redpanda-connect_4.111.1_darwin_arm64.tar.gz"
        sha256 "f4f6bb13ea57413eaf02684f766b2385aa2fe6b7a1600c6f1539a227cef1e2d7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/redpanda-data/connect/releases/download/v4.111.1/redpanda-connect_4.111.1_darwin_amd64.tar.gz"
        sha256 "318944daf349c20d9d43efe8f32e48567270c366eda226dcf3ef1043687ff69c"
    end
  end

  def install
    bin.install "redpanda-connect"
  end
end
