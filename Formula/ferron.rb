class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "2.8.1"
  license "MIT"

  livecheck do
    url 'https://github.com/ferronweb/ferron'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.1/ferron-2.8.1-aarch64-unknown-linux-gnu.zip"
      sha256 "d4b5174146cbbd57a83f61b52dc2f969c5afbcaeb212531416ae7d5aa9769d07"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.1/ferron-2.8.1-x86_64-unknown-linux-gnu.zip"
      sha256 "3cf41cb1758c9fc653354a7fa5be2ca88a10a03a764cd82df67545216a3c5302"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.1/ferron-2.8.1-aarch64-apple-darwin.zip"
      sha256 "a2eb94f6c46a8093822dba935fd9641bf3c0a23369296e7e6afa9b70cf25e077"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.8.1/ferron-2.8.1-x86_64-apple-darwin.zip"
      sha256 "60d3d44613eb84a6262f3e0b36e61fb0712146532e8127164377f567d78fac22"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
