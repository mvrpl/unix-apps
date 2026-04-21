class Vixcpp < Formula
  desc "A modern runtime for building and running C++ applications"
  homepage "https://vixcpp.com"
  version "2.5.0"
  license "MIT"

  livecheck do
    url 'https://github.com/vixcpp/vix'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/vixcpp/vix/releases/download/v2.5.0/vix-sdk-linux-x86_64.tar.gz"
      sha256 "56e19c06422264f3d12c7fee7b422fb34091b0a8598a66015812b35e82893386"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vixcpp/vix/releases/download/v2.5.0/vix-sdk-macos-aarch64.tar.gz"
      sha256 "80dfcafc049183e1f2830adb0ebbc03da71259198fe306bb738e79d4deece7ab"
    end
  end

  def install
    bin.install Dir["./bin/*"]
  end
end
