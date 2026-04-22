class Vixcpp < Formula
  desc "A modern runtime for building and running C++ applications"
  homepage "https://vixcpp.com"
  version "2.5.1"
  license "MIT"

  livecheck do
    url 'https://github.com/vixcpp/vix'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/vixcpp/vix/releases/download/v2.5.1/vix-sdk-linux-x86_64.tar.gz"
      sha256 "24eaf9da32fcd88a94b9aca89713b1a597b82d3485c05a220e84877c8db6255f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vixcpp/vix/releases/download/v2.5.1/vix-sdk-macos-aarch64.tar.gz"
      sha256 "91690bf9df14cebdb0211b25755e955bcf4ff6f0509d5503ba021bd47ea76b85"
    end
  end

  def install
    bin.install Dir["./bin/*"]
  end
end
