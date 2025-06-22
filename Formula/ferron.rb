class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.3"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.3/ferron-1.3.3-aarch64-unknown-linux-gnu.zip"
      sha256 "0c7eab6cc09208fc560f59840ed0bc31e899eb45829ec58bb9d17c010dc70d93"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.3/ferron-1.3.3-x86_64-unknown-linux-gnu.zip"
      sha256 "090546eea55aa5fac6e774391d3c4c31671a14abd73680184d41c70c2efee209"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.3/ferron-1.3.3-aarch64-apple-darwin.zip"
      sha256 "76d9f508f5f52013cc4b2e3cca4145a82c0fd0d85d8cc6ca9896ccd4c1d52e96"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.3/ferron-1.3.3-x86_64-apple-darwin.zip"
      sha256 "bb7ad34b3e95c25fbc05ca43b73603aa6745d96827797042b2c38c8c2f7fbc39"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
