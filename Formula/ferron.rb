class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.1.2"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.2/ferron-1.1.2-aarch64-unknown-linux-gnu.zip"
      sha256 "992e7b712e849c60ee4cf88e99cb2763569aa12eada99ef1f04256fe2cd6b936"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.2/ferron-1.1.2-x86_64-unknown-linux-gnu.zip"
      sha256 "cab4173babb3e98ca9e3a42a7a15d062842428c06b709c4ef627bc68646f53d6"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.2/ferron-1.1.2-aarch64-apple-darwin.zip"
      sha256 "334c712147373d68380446701e8e8cbed9ed5fc0fe1d9c523be5f9eb0095f2b5"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.1.2/ferron-1.1.2-x86_64-apple-darwin.zip"
      sha256 "71ec1c1e15d9410aac56e42be7838857517bb0fdf2dcc41355c6d0fe253681e6"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
