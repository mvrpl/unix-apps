class Kssh < Formula
  desc "SSH Log-in with AWS KMS Key"
  homepage "https://github.com/mvrpl/kssh"
  version "1.3.4"
  license "MPL-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/kssh/releases/download/v1.3.4/kssh-linux-x64"
    sha256 "eada880502927a5188ba9883e64fe7a1378efc446fd8c878ea239bb7e3b2f8a7"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.3.4/kssh-macos-arm64"
      sha256 "c2d54fb1127a0c8149c97ac9101b8659fc81aa5525cbb66a96957916973f2ab5"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/kssh/releases/download/v1.3.4/kssh-macos-x64"
      sha256 "c2d54fb1127a0c8149c97ac9101b8659fc81aa5525cbb66a96957916973f2ab5"
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
