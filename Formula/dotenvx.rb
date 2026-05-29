class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.69.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.2/dotenvx-linux-arm64.tar.gz"
      sha256 "dc60c17bf1f0f1b947b72d0374740e7a79b5f95aeb826967821f0540557ffccd"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "aa092f7fa71584b03e6d5e8fe34bb0a98475971f27c2047d20aace95a64b777a"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "54816c9d9f3880da6d35163ec9d8f8397bc80a06a95702f9692d54ad261d47c9"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.69.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "5edc337afdc4b7eb2b05f9bb65f8f6a3e82688a1a5e2d4dfb1376ddb384b1e65"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
