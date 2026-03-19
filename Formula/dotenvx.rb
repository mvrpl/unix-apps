class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.56.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.56.0/dotenvx-linux-arm64.tar.gz"
      sha256 "299196afb478d32881e59467c4a42697141ff1527ca99fd3e81e7030facf1dc8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.56.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "736b3ffeaa49a69f9dfc38db68d66829c027ace354b79a2d70cb4b68c20310b0"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.56.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "d719e5e2a77fc9d322237a548b51b74e5e02450555cf23d91f796992c85a1b94"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.56.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "847b2d7e2549c3476c36eb1807204cdd5c01c4a1bc5ebc38f3783778c48086ca"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
