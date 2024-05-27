class Speedtest < Formula
  desc "Runs your internet connection speed tests"
  homepage "https://github.com/mvrpl/speed-test"
  version "1.5"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/speed-test/releases/download/1.0/speed-test_Linux_x86_64.tar.gz"
    sha256 "a198aab7a460ff2beccc5c64f5e6c438191d357fb1946694a4287179cee33522"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/speed-test/releases/download/1.5/speed-test_Darwin_arm64.tar.gz"
      sha256 "7639208be96bc4090eec82ae3920b1362a10cde3c73e67ee65dea2aa9b19d8ae"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/speed-test/releases/download/1.0/speed-test_Darwin_x86_64.tar.gz"
      sha256 "39f39c73c7989c5f667a2c17353d85b45ca4d24545812c2f06ec1a7ef70bdd43"
    end
  end

  def install
    bin.install "speedtest"
  end
end
