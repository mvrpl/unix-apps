class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.8"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.8/ferron-1.3.8-aarch64-unknown-linux-gnu.zip"
      sha256 "323c3d5d7ebc6eba721373cdc6918f12c1804eb759a6a7aea6ce3b913131f14d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.8/ferron-1.3.8-x86_64-unknown-linux-gnu.zip"
      sha256 "6d7f0683a21cbeed60b17e197d3992b8498bbbba0a88623acc11dca24a724e7e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.8/ferron-1.3.8-aarch64-apple-darwin.zip"
      sha256 "5024db1ebf5cd3dde313f887047fe41d8ea5829e9ba77cd44755f43ab9977ea2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.8/ferron-1.3.8-x86_64-apple-darwin.zip"
      sha256 "26c5ffd974a23f97da5a67aa9e5073d4c6e2af0f96b928b4e0130d7b9595609d"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
