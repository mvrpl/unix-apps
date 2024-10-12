class Gofm < Formula
  desc "GoFM is a cross-platform real-time audio streaming server for MP3 files"
  homepage "https://github.com/ssnat/GoFM"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ssnat/GoFM/releases/download/v0.2.1/GoFM-linux-arm64-v0.2.1"
      sha256 "3f2755e5afa6c0aeb5edd5e0f9af6db27078c500b70720339d53a23df0b64535"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/ssnat/GoFM/releases/download/v0.2.1/GoFM-linux-amd64-v0.2.1"
      sha256 "1030314302a900dc1682055e86ea75f3473adb006d70442b836ac487080e188a"
    end
  end

  def install
    if OS.linux?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "GoFM-linux-arm64-v0.2.1"  => "gofm"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "GoFM-linux-amd64-v0.2.1"  => "gofm"
      end
    end
  end
end
