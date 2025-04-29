class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.1.1"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.1/ferron-1.1.1-aarch64-unknown-linux-gnu.zip"
      sha256 "ced1dc4c9f0790e5d95feaccdadcd019a6e10b89fccee306b3949c74c0103449"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.1/ferron-1.1.1-x86_64-unknown-linux-gnu.zip"
      sha256 "da553e323e4c9a7ad394ea9b3d1f70eb082e9af2526da5da2c99a21e7d17c9b1"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.1/ferron-1.1.1-aarch64-apple-darwin.zip"
      sha256 "3c11caeed1700cf3c6fc5d524f2699b22f355e5fe79996692251084c888a7d17"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.1/ferron-1.1.1-x86_64-apple-darwin.zip"
      sha256 "c67b11ae403e00ec3a6ac8338a0d940dd2da7f8c8e9e13f4fe0588ae483475ac"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
