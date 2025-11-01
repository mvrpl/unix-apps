class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.6"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.6/ferron-1.3.6-aarch64-unknown-linux-gnu.zip"
      sha256 "596b3b037a80417fa9542030dcb124630f65b286aecb4ac805053bd700149f23"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.6/ferron-1.3.6-x86_64-unknown-linux-gnu.zip"
      sha256 "7cb5b4c0efd0db0ec82e8508905d1c5d2fe077bfa733035e20121ca6f1fabbc5"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.6/ferron-1.3.6-aarch64-apple-darwin.zip"
      sha256 "b9acc5283ae1f4638b6f0372609deceb9fc7c3356621d551c040e7e68354c11a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.6/ferron-1.3.6-x86_64-apple-darwin.zip"
      sha256 "a37963c8fae3922e0e925c47da34244d82abd2c1cabca7e1145f90d950dbbaf2"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
