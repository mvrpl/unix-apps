class Vixcpp < Formula
  desc "A modern runtime for building and running C++ applications"
  homepage "https://vixcpp.com"
  version "2.5.2"
  license "MIT"

  livecheck do
    url 'https://github.com/vixcpp/vix'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/vixcpp/vix/releases/download/v2.5.2/vix-sdk-linux-x86_64.tar.gz"
      sha256 "64db8145dbefe61ee5ecc5152d1571420ef5065d03665714d098c5202cefe53b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vixcpp/vix/releases/download/v2.5.2/vix-sdk-macos-aarch64.tar.gz"
      sha256 "cf232b376d93fead224d232ebbba18b407e3cd34eb3a793cfd612e05c6dca3c9"
    end
  end

  def install
    bin.install Dir["./bin/*"]
  end
end
