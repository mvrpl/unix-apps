class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.7"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.7/ferron-1.3.7-aarch64-unknown-linux-gnu.zip"
      sha256 "7a93abfacf9a5d7e88d8bd79e494f7762a1b5cd50e45dee38b477b0431a1b7ff"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.7/ferron-1.3.7-x86_64-unknown-linux-gnu.zip"
      sha256 "0baf421685f672d5550723bc883369e4a7349c27b3d5f487a91c5c66604ddd1e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.7/ferron-1.3.7-aarch64-apple-darwin.zip"
      sha256 "30536d16d86fae16d4e6e13c2a5f17975d0b348a1e0e00233ca522efb2a98106"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.7/ferron-1.3.7-x86_64-apple-darwin.zip"
      sha256 "a59dbf88ea58d23f239e2c81afba74ce8149f0fbb0f7de612cf190209eca4b48"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
