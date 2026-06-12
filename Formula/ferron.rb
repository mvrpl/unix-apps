class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "2.8.0"
  license "MIT"

  livecheck do
    url 'https://github.com/ferronweb/ferron'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.0/ferron-2.8.0-aarch64-unknown-linux-gnu.zip"
      sha256 "a61f24a92aac2450595d21e96ed503bfad748ba128bc661a5885511089f33a7b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.0/ferron-2.8.0-x86_64-unknown-linux-gnu.zip"
      sha256 "ff55aae18634cffbd60e0324aa20eaa9d3757f4d81f12d087cc392cc06c369a5"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.0/ferron-2.8.0-aarch64-apple-darwin.zip"
      sha256 "093508580f74b2427b184fef05c51ccb79dfec1dbef2264ee2d68653a8a31b4d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.0/ferron-2.8.0-x86_64-apple-darwin.zip"
      sha256 "ecc0815de90cddfe1f8370ad40d5f535dd34c865f214492b91d52ae82b12438b"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
