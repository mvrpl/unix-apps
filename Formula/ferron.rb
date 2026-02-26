class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.9"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.9/ferron-1.3.9-aarch64-unknown-linux-gnu.zip"
      sha256 "beef3d509393c4a6697257ee5062160d107702059360f6b578ba501e795e5e3a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.9/ferron-1.3.9-x86_64-unknown-linux-gnu.zip"
      sha256 "ee5028256321662eb44368011200f25ad38f1f504f0be72fcb91b8e0a895ff1f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.9/ferron-1.3.9-aarch64-apple-darwin.zip"
      sha256 "96b325ca0541098096e8dfdad4878dba7cb133bfa0480b5e0245799ea0e89dba"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.9/ferron-1.3.9-x86_64-apple-darwin.zip"
      sha256 "bd79e1cbee89e20c8e1a9d028df43672405b27476907ad2ff22470e9c5bd510b"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
