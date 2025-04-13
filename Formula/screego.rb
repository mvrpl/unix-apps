class Screego < Formula
  desc "Screen sharing for developers"
  homepage "https://screego.net"
  version "1.11.3"
  license "GPL-3.0"

  livecheck do
    url 'https://github.com/screego/server'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.3/screego_1.11.3_linux_arm64.tar.gz"
      sha256 "f45a3202454dc5095166dd118b3599570229a2e8fe61ba098bc02cc00da0da28"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.3/screego_1.11.3_linux_amd64.tar.gz"
      sha256 "10750ba84150ba50962b3e74bf45829a25903d8e440058d7e1ea5fb2f8a3d5a2"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.3/screego_1.11.3_darwin_arm64.tar.gz"
      sha256 "04e86a416ca722e775f1aaa0ba9fd32cd5f30bc66bb675f9c23f5324a7c3cd5a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/screego/server/releases/download/v1.11.3/screego_1.11.3_darwin_amd64.tar.gz"
      sha256 "8a8f293397e0a59fcd23b6d34e94d9d83e767265eb06d916f0c79f1c962c5554"
    end
  end

  def install
    bin.install "screego"
  end
end
