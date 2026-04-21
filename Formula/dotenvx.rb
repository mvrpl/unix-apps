class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "1.61.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.2/dotenvx-linux-arm64.tar.gz"
      sha256 "1cd685bef52c5e924864ccfd45dfa17f7088c7ad1a6baf5256a760f09b65d8d8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "bd5a48c91a2e96271efb90e8e5012645b8b9f66239522efbf89d7e0fa9691e32"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "eed15b15222a30895d4f35df1da46914cb833ade26c4d5707c278fcc91e425a0"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v1.61.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "bb2a2cf9e67be5a6d050995b8944d7af944b0989d800dadbbfaeec70ffdb5499"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
