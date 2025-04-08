class Chsht < Formula
  desc "Cheat Sheets on Terminal"
  homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
  version "1.0.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/1.0.0/chsht-linux-amd64"
    sha256 "9d07a29f6270d16b929bd23c7dfe747b7bc04be10dcab2bc5b984c08679d0469"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/1.0.0/chsht-macos-arm64"
      sha256 "15b090211c28a76317b605564b2098ce6e75dcfe532f18a208dd7d76fe44092f"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/1.0.0/chsht-macos-amd64"
      sha256 "15b090211c28a76317b605564b2098ce6e75dcfe532f18a208dd7d76fe44092f"
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
