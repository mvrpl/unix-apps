class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.30.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.30.0/dotenvx-linux-arm64.tar.gz"
      sha256 "b43448fde8b559ae53472ee6a97e549fe1eeb4a0dc000909f7fa20f128e577ce"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.30.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "1ac0fb8fef37c10de4297686a273719290fbc29d8c3abf9595ab7a023119c1c3"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.30.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "64e47df5c77e56e876d2e6a9d245f2d42037c2b4ea8f3efd6eb8bcba98c18dc2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.30.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "bff08b5bf00d350f6d3acd2f2db6b8f7fd32bed486d99543a4949f791adddfde"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
