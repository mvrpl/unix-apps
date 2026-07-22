class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.17.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.2/dotenvx-linux-arm64.tar.gz"
      sha256 "98b2838cab585dfffa2bdcf24f76cfdb32c6e49d3a21dd64cd3cb760b20df533"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "09f58af81c616c227690bf9ee5c5a72ee836c6cce0bbd1a6c290b0414b424dec"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "7bbcc9b94a1b17640e0e91a3e9451d6406db9ff839a7355bd76aff0955a5f173"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "e36d52eed8487736f46b539444a3a673200cf7fc51d4bacabf9e0cede7d95371"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
