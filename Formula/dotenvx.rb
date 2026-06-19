class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.74.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.2/dotenvx-linux-arm64.tar.gz"
      sha256 "8a61f9f838f942a20a34c76a364fa989488a7c4203b6f208f1d3e50ec6a9f7b3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "3bf3010cfbc6d948abb48e0014f0eb0c8d08f9f3ae3607e3ed8afece45e00f72"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "f22bb97f58574cf2973d8e65e55f6cade7ff3fcf25955fb102d93c3459e6f30f"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.74.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "add851f7fe5e8ce02216a7c9850a844ed291989e7985d8e81d7f30ad0ef1eab3"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
