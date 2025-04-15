class Kssh < Formula
  desc "SSH Log-in with AWS KMS Key"
  homepage "https://github.com/mvrpl/kssh"
  version "1.2.6"
  license "MPL-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/kssh/releases/download/v1.2.6/kssh-linux-x64"
    sha256 "233254e7c23ad15b55535ede65198f68770b1d6742c71703257c59b47998418b"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.2.6/kssh-macos-arm64"
      sha256 "52e4409b2a8619be36bd85a2fd5844e5ebf7e6f0960b0251cc7f7673fae38eb2"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.2.6/kssh-macos-x64"
      sha256 "52e4409b2a8619be36bd85a2fd5844e5ebf7e6f0960b0251cc7f7673fae38eb2"
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
