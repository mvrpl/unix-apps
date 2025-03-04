class Chsht < Formula
  desc "Cheat Sheets on Terminal"
  homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/0.5.0/chsht-linux-amd64"
    sha256 "60da6cb57b6efbf315f99b98de12e4930a4f84ea49c618ce169e8394bb805ef8"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/0.5.0/chsht-macos-arm64"
      sha256 "c7a8dfdc43d15626ca5a137dd1eebb683f71c894aecc8d2a1d8a263956b65c92"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/0.5.0/chsht-macos-amd64"
      sha256 "654d5241400e71b1493c8ca9fba4dcb4406e4362e453128694922cfc82639b7d"
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
