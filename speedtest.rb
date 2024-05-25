class Speedtest < Formula
  desc "Runs your internet connection speed tests."
  homepage "https://github.com/mvrpl/speed-test"
  version "1.0"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/speed-test/releases/download/1.0/speed-test_Linux_x86_64.tar.gz"
    sha256 "a7006243ebfe2b5a5c6cf8f9f350e391fc5ceffd6028a0915cd032403de3d8c4"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/speed-test/releases/download/1.0/speed-test_Darwin_arm64.tar.gz"
      sha256 "94c4d876f6785e27735d3497cb73afa1f1851f111803c70eb0b2f0f754647531"
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