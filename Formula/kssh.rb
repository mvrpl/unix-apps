class Kssh < Formula
  desc "SSH Log-in with AWS KMS Key"
  homepage "https://github.com/mvrpl/kssh"
  version "1.2.3"
  license "MPL-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/kssh/releases/download/v1.2.3/kssh-linux-x64"
    sha256 "c66abcdf762b16ced254dc4c003cb7d401d6624943a56bbc920fea0a3bc3caa4"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.2.3/kssh-macos-arm64"
      sha256 "7deea31bcff02df5d5c71040c9ab2ca40346a7fe5a8759f9f1565cdd62cf9afa"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.2.3/kssh-macos-x64"
      sha256 "7deea31bcff02df5d5c71040c9ab2ca40346a7fe5a8759f9f1565cdd62cf9afa"
    end
  end

  def install
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      bin.install "kssh-linux-x64" => "kssh"
    end

    if OS.mac?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "kssh-macos-arm64" => "kssh"
      end

      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "kssh-macos-x64" => "kssh"
      end
    end
  end
end
