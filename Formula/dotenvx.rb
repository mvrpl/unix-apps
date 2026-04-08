class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.60.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.2/dotenvx-linux-arm64.tar.gz"
      sha256 "05755c6a757309fd0c0d3640e1a6c93f64650dbcd5f32de177c8ec91a1fc4a1f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "dec4d9433716981f9e9c2c72766a9c3f80cd1ad30188b9f14b7109e9bb10d2c2"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "53f04496974ca372236c326dbc29cd889587a74679982eebd780d4c6b5eafe63"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.60.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "2f01b3ca597180e0f241f3652378c1d5ad79c47be9686be220f292b307d09c14"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
