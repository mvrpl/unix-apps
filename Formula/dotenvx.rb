class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.17.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.3/dotenvx-linux-arm64.tar.gz"
      sha256 "d7a3eb5bfe3d43e6d13180a2219db86123e449d020e12e76492cc956a448bfa8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "70f9d4454ee21402787fe816c5f02ecc14900f573cc0244ed52835518b284117"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "c86630165410b186b9b4fd4afe04fbf0d4c767d8179e3cce93aedb3d5fb67901"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "bacbbf2826b48bae544e8247199ca6f1fee8e49413e606402eb8c3abbc4c88d5"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
