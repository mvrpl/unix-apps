class Chsht < Formula
  desc "Cheat Sheets on Terminal"
  homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
  version "1.0.1"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/1.0.1/chsht-linux-amd64"
    sha256 "cb9386121baf399bb733cf195db9f59c4b27e53756edd35dc14e637b86d9b6b0"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/1.0.1/chsht-macos-arm64"
      sha256 "5f383796cf4ff088060f2b8b756ff1eed2464ec660e26473f2dd1a2af991bc8b"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/1.0.1/chsht-macos-amd64"
      sha256 "5f383796cf4ff088060f2b8b756ff1eed2464ec660e26473f2dd1a2af991bc8b"
    end
  end

  depends_on "less"

  def install
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      bin.install "chsht-linux-amd64" => "chsht"
    end

    if OS.mac?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "chsht-macos-arm64" => "chsht"
      end

      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "chsht-macos-amd64" => "chsht"
      end
    end
  end
end
