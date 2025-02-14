class Kssh < Formula
  desc "SSH Log-in with AWS KMS Key"
  homepage "https://github.com/mvrpl/kssh"
  version "1.1.12"
  license "MPL-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/kssh/releases/download/v1.1.12/kssh-linux-x64"
    sha256 "770bd931db81edb1af2020ccbc11e6181ce4beddac75c95a920e8d28c5df3ae6"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.1.12/kssh-macos-arm64"
      sha256 "3eef15166de1686e6bf06092b606dd91b83578e6a86cac13368d2d5b2cde99b4"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.1.12/kssh-macos-x64"
      sha256 "3eef15166de1686e6bf06092b606dd91b83578e6a86cac13368d2d5b2cde99b4"
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
