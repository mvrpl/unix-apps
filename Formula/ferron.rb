class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.1"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.1/ferron-1.3.1-aarch64-unknown-linux-gnu.zip"
      sha256 "af417c891558d6e36ed5ddb8d95a81abfc62d9971b2cfb9709b0c058344e0fcb"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.1/ferron-1.3.1-x86_64-unknown-linux-gnu.zip"
      sha256 "c777cbb6122b9dac55e3ec3db1933a36f29b7e999054746d71b226dc048c748f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.1/ferron-1.3.1-aarch64-apple-darwin.zip"
      sha256 "2522a3f6a513cc02bf0bd5b5c39f593c125414896cc37e782142e6d339fc02ba"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.1/ferron-1.3.1-x86_64-apple-darwin.zip"
      sha256 "4cd6cc948a543793faf543553da97174c7cedf97c04725d239e819f81ccac8b5"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
