class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.7.3"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.3/dotenvx-linux-arm64.tar.gz"
      sha256 "3ca86a599a28b1cdc9d9d602d6baf79c839b4cd5724acb6da40a6345b04bafca"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.3/dotenvx-linux-x86_64.tar.gz"
      sha256 "436c32e817fb28b190ca709115e910fe579a5135bfc66236c417de8217d09399"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.3/dotenvx-darwin-arm64.tar.gz"
      sha256 "49db0dbb95c8f9de293710bab5403d74ace7c649c4b2a9bb353ac3cf9b97fe09"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.7.3/dotenvx-darwin-x86_64.tar.gz"
      sha256 "85a63503d96abde39edbd8538e78a5d63acb2d637aa5ecb8fe595926c4f3bca8"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
