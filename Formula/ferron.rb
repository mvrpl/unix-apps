class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.0.0"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.0.0/ferron-1.0.0-aarch64-unknown-linux-gnu.zip"
      sha256 "724f6a4231aad109b5918f2bbe0e3597e7700f2ebbc19988ede66247152a4176"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.0.0/ferron-1.0.0-x86_64-unknown-linux-gnu.zip"
      sha256 "d6e4b058555a35bef03080c1b34c9417dde4a56a58dc1faf628bfcda813d6950"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.0.0/ferron-1.0.0-aarch64-apple-darwin.zip"
      sha256 "57c24c1f093e5bead0ec1f8d2e7672463ab9c6d0fe9edb26c4719b253912a469"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.0.0/ferron-1.0.0-x86_64-apple-darwin.zip"
      sha256 "89ea2c12dc1fb2001c171e3e4ae7d8840f5923715b9a0247fa185b3f3ff81b45"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
