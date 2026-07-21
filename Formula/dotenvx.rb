class Dotenvx < Formula
  desc "A secure dotenv from the creator of 'dotenv'"
  homepage "https://github.com/dotenvx/dotenvx"
  version "2.17.1"
  license "BSD-3-Clause"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.1/dotenvx-linux-arm64.tar.gz"
      sha256 "62961520801fba5955d143c533f966d4d93fa5adb9edd1edbde3941e90bbde3b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.1/dotenvx-linux-x86_64.tar.gz"
      sha256 "d800defa2547407e58e1d0a81397c12b15caf0a6a27f66e89b83b411cef1229b"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.1/dotenvx-darwin-arm64.tar.gz"
      sha256 "c23fc701804c04670c51edf227bd2ebb8c3e1f108b76eb5bbb9248d8674854f4"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dotenvx/dotenvx/releases/download/v2.17.1/dotenvx-darwin-x86_64.tar.gz"
      sha256 "a9b12639239e92db6a7e43028dffb8f07339e0de63fe453bb87b6bcf678de64f"
    end
  end

  def install
    bin.install "dotenvx"
  end
end
