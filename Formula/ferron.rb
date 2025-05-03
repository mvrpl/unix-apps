class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.2.0"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.2.0/ferron-1.2.0-aarch64-unknown-linux-gnu.zip"
      sha256 "cec568a5de3d272a0b5eb118b9d376a5dfc8292b251e4b21348fc0f4a81466cc"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.2.0/ferron-1.2.0-x86_64-unknown-linux-gnu.zip"
      sha256 "186d5d3410d6a51023dc983a28407ac81f8699561e06a39e6ae9ac0f65caf69c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.2.0/ferron-1.2.0-aarch64-apple-darwin.zip"
      sha256 "c6b211ceb6b214e517eff76360ad7fa1bcb6ae40bb9468689cb00a456ad29353"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.2.0/ferron-1.2.0-x86_64-apple-darwin.zip"
      sha256 "ef65994dc5c4591cd41103ce6ec46f4c35a42eeaf0409398a64fcffe2639cea1"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
