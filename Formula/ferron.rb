class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "1.3.5"
  license "MIT"

  livecheck do
    url 'https://downloads.ferronweb.org/latest.ferron'
    regex(/^([\d\.]+)$/i)
    strategy :page_match
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.5/ferron-1.3.5-aarch64-unknown-linux-gnu.zip"
      sha256 "59e35518031e23f9e897916d0d5d16d67b9844ba90c3ae62d6927201a49d5608"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.5/ferron-1.3.5-x86_64-unknown-linux-gnu.zip"
      sha256 "ae7a5504ec6810c25055ca351c49096133493a49e004ecf1b7380c6378297378"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.5/ferron-1.3.5-aarch64-apple-darwin.zip"
      sha256 "71ddb05d32797446a2a3054795243a24029485e75856843583842b4f99c478b4"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/1.3.5/ferron-1.3.5-x86_64-apple-darwin.zip"
      sha256 "4073ee1439de22f3e09094f056a8967fe911d3affe8e29d49597f369191ef315"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
