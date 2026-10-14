class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.36.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.36.0/dotenvx-linux-arm64.tar.gz"
      sha256 "f3623970875b660fc5bc574314e9bed4c14ee89a8da933e4ab7be2228b78bef2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.36.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "a2ec2a3e1a225ab9a2f7d2bf23138bea81a81afca1bf79bab0dce95310dadbb8"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.36.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "b9cdcf00b26a84e6adbb8a1c14c2d336284c1848443f1317d64d73cd3a665e15"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.36.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "15347c7f0cd22f1a3119e45008bd5823fd36301269af786fad5f4f0cd1446ee5"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
