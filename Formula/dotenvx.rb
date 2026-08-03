class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.19.2"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.2/dotenvx-linux-arm64.tar.gz"
      sha256 "cf77f35bd5c379015ae6bd9c417b9328bc262b66e9219fbd7a3e4576a3c238f5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.2/dotenvx-linux-x86_64.tar.gz"
      sha256 "134427d2baf80b73794c6922b4558bea3c49fbc89b130dba03350dee8d4d7388"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.2/dotenvx-darwin-arm64.tar.gz"
      sha256 "0228dd018a40ba5cc67eb82df158ec552cb3d1d143a32f9cce8c15105f304ef7"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.2/dotenvx-darwin-x86_64.tar.gz"
      sha256 "1a7c0f43b8ce2b750c50b178f579d5c0e27a8d7b5bf6a8bf6d9561ac27749c85"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
