class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.50.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.0/dotenvx-linux-arm64.tar.gz"
      sha256 "7d3859ebd9ca831ca8b07b58581c1255d2fb3f148764fa85c8f03c1320572521"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "9fcbebd9f7544c84a2edb7858a736c679d222a149972c665fdfc34cc4d65b231"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "22abd12becd1ad5f5528cf3824ec641c9739e4147493568bc558a026bd32e104"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.50.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "7b665b9752abe9b8c1ad9249f76391d487457926a4905cabe19a49d3577e1386"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
