class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.11.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.2/dotenvx-linux-arm64.tar.gz"
      sha256 "3872afe0909f8cc39ea6cbba1505e2c77fb6fa78d459c00e2ffa16fd46227976"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "72807c642fc31704dceb5280657ae1e418ef8f9b389d1e426c5fb396c6fa80d5"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "49d1a29f6fe93772d3ac5658f7da554c96e1990cd6a5f75bc50b3dad7db105e4"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.11.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e2d37361deb09a1d46e3556776f24598afe788c62904dd25b75a25fe56de0dd6"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
