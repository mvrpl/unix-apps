class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.38.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.0/dotenvx-linux-arm64.tar.gz"
      sha256 "7520837e28a4092f4ea1a36c95db212e479ce3aaabf40cc711334619749cc0a3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "44b1f050f8c9f618a127f78da549468a3eab63510efe980a5253698c2c7e849c"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "02ef074074f0ef969bff921ac58cfcc59deebb5003137743b4f88c228904c472"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.38.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "7c02d9068c13eaf03c8266f7bf6eac5ce0ba91bc657a71df650098a9f315b484"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
