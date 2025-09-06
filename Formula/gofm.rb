class Gofm < Formula
  desc "GoFM is a cross-platform real-time audio streaming server for MP3 files"
  homepage "https://github.com/pxgo/go-fm"
  version "0.2.4"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pxgo/go-fm/releases/download/v0.2.4/GoFM-linux-arm64-v0.2.4"
      sha256 "92a448c282b9c9b471373a522beca8cf79e451e8af05ae13cc0429d9f42ca3e5"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pxgo/go-fm/releases/download/v0.2.4/GoFM-linux-amd64-v0.2.4"
      sha256 "25f42d3250133c7deb07e8bf5ab943d352bc5c765f37793333b86ff2030176c4"
    end
  end

  def install
    if OS.linux?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "GoFM-linux-arm64-v0.2.4" => "gofm"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "GoFM-linux-amd64-v0.2.4" => "gofm"
      end
    end
  end
end
