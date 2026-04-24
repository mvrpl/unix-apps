class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.63.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.63.0/dotenvx-linux-arm64.tar.gz"
      sha256 "8ff7ba044c81823afa5789eb14e1c769bffc9c1db9a1656b3a3ba786aa090319"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.63.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "da11ace627516af97f5662af10aca7ce140e11ba47720e868bbae97c3720ebeb"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.63.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "37205d3f8a051bb923231fab7f09d80d8dc56194e313514dae250302efa1e0c8"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.63.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "86392428728bde05d550100b8f4017ef11e8ad2004b8927e06e53e5e04db57df"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
