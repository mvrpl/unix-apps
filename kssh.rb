class Kssh < Formula
  desc "SSH Log-in with AWS KMS Key"
  homepage "https://github.com/mvrpl/kssh"
  version "1.1.6"
  license "MPL-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/kssh/releases/download/v1.1.6/kssh-linux-x64"
    sha256 "e874b37cc2f5363ca0d31496b6e73858e852bb1f64228a321d2fbdd00f7f45e4"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.1.6/kssh-macos-arm64"
      sha256 "9df0e1268378053819801628fc7d02c761db27a09c087033dc2d93799007f128"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.1.6/kssh-macos-x64"
      sha256 "9df0e1268378053819801628fc7d02c761db27a09c087033dc2d93799007f128"
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
