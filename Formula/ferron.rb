class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.2"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.2/ferron-1.3.2-aarch64-unknown-linux-gnu.zip"
      sha256 "9576dce6fd43935b50468093ee174213cd355fd3c1f82d32d176f827563fe4ec"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.2/ferron-1.3.2-x86_64-unknown-linux-gnu.zip"
      sha256 "502f37821971a38f8b2b01da47673e9069eb7bf52ef24e6bfa1c24a7bc92b8f4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.2/ferron-1.3.2-aarch64-apple-darwin.zip"
      sha256 "dc256c05fff59354a3863b2618cd0ad55860dc60ab3da711297b9c0d82f62816"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.2/ferron-1.3.2-x86_64-apple-darwin.zip"
      sha256 "6e8913934fbdbb1e90536b912913dde9ee0518eef8b0691bca7c9eba2b6d4791"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
