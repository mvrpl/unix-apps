class Easeprobe < Formula
  desc "A simple, standalone, and lightweight tool that can do health/status checking, written in Go"
  homepage "https://github.com/megaease/easeprobe"
  version "2.1.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/megaease/easeprobe/releases/download/v2.1.1/easeprobe-v2.1.1-linux-arm64.tar.gz"
      sha256 "d5efb49b5d05583aeae35b20ec721743512c25de79043b03ac5eb1bb7e49a073"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/megaease/easeprobe/releases/download/v2.1.1/easeprobe-v2.1.1-linux-amd64.tar.gz"
      sha256 "b359edbf6cf333024bc68ef5f45a3053fb81c0dfe9af8ff077c3a4bc9ecafd4e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/megaease/easeprobe/releases/download/v2.1.1/easeprobe-v2.1.1-darwin-arm64.tar.gz"
      sha256 "3a4f9c42a9add3ed5d7ce0ce2d9dd899df8d164d1aa39ea4b265ae71a555888c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/megaease/easeprobe/releases/download/v2.1.1/easeprobe-v2.1.1-darwin-amd64.tar.gz"
      sha256 "4bc021e38df39d0ea2dc5a465146bc5e455964dec64fb366dedf2447be64d5cc"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
