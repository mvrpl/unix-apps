class Ferron < Formula
  desc "A fast, memory-safe web server written in Rust"
  homepage "https://www.ferronweb.org"
  version "2.7.0"
  license "MIT"

  livecheck do
    url 'https://github.com/ferronweb/ferron'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.7.0/ferron-2.7.0-aarch64-unknown-linux-gnu.zip"
      sha256 "df1391e3701e5ecc90159bd61b3538e02e2f5375327ffc8333e3d704c7892c0a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.7.0/ferron-2.7.0-x86_64-unknown-linux-gnu.zip"
      sha256 "c95571031f0623a7a5364053a7b4ed920e3e86f5fd458fdbf0654b803cbd837c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.7.0/ferron-2.7.0-aarch64-apple-darwin.zip"
      sha256 "2c8bf08253c401cdcf5289fcb2dea8a64ab34a2f586d5fe50d88611b6fb47426"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.ferronweb.org/2.7.0/ferron-2.7.0-x86_64-apple-darwin.zip"
      sha256 "08797b89ad702ac08be69e0b8ae7d892e10ff28e3ce55f79f550616c5733e54b"
    end
  end

  def install
    bin.install "ferron"
    bin.install "ferron-passwd"
  end
end
