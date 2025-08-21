class Gofm < Formula
  desc "GoFM is a cross-platform real-time audio streaming server for MP3 files"
  homepage "https://github.com/ssnat/GoFM"
  version "0.2.2"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ssnat/GoFM/releases/download/v0.2.2/GoFM-linux-arm64-v0.2.2"
      sha256 "22d5da8ff902ca1a9fe47bdf5a5d976bb27fef7e5040d1f84dce02200ef32aed"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ssnat/GoFM/releases/download/v0.2.2/GoFM-linux-amd64-v0.2.2"
      sha256 "db158d70dd88e439fbc2eca6e66f401bc148cbb52c3ac4f66ccab778350d4e9c"
    end
  end

  def install
    if OS.linux?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "GoFM-linux-arm64-v0.2.2"  => "gofm"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "GoFM-linux-amd64-v0.2.2"  => "gofm"
      end
    end
  end
end
