class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.54.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.1/dotenvx-linux-arm64.tar.gz"
      sha256 "73240b527bc3a8c8cf4e38efdd6957459e91961af772896b0a92af9422bf2540"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "2770dc06ba27dedcd86c298e84b5a071fbbaec0125fc20ee38112be80168a874"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "f5bbaacf3800b6bb7a00362664e214cef5b75b084175f6f59562345faba36b8d"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.54.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "aa098ece70c2c9b16485f8344e42ff7be07fd9c90ea3e57f1061d6e82ffa406d"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
