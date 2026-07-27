class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.19.0"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.0/dotenvx-linux-arm64.tar.gz"
      sha256 "49bf227eccd55ae1264a468fd7c92e3157b5fb1f93dbf7fe34bf849662d9fdec"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.0/dotenvx-linux-x86_64.tar.gz"
      sha256 "fce261384c96716f836f88e89e39ba694724f5d7a836f0d246556db6c1da62e7"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.0/dotenvx-darwin-arm64.tar.gz"
      sha256 "2ff1b6e09cc3f9761ee15eff140475c057f77bf1ebd762ae7cf5050b6f8a39b7"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.19.0/dotenvx-darwin-x86_64.tar.gz"
      sha256 "47271559fb16e9d8d29d4075e8a72fd5266739a0f2c8d134dc876097a7f4aeaa"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
