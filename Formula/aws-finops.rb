class AwsFinops < Formula
  desc "Um painel de custos e recursos da AWS"
  homepage "https://github.com/diillson/aws-finops-dashboard-go"
  version "1.3.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.3.0/aws-finops-linux-amd64"
    sha256 "440e4548c1f65204f03c1a1f0647657a3940a5ede70e6f450bf874e6bff782b9"
  end

  if OS.mac?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.3.0/aws-finops-darwin-amd64"
      sha256 "deb36c5739ada8c8d7f3fddb4e4b62f453248018a0985e8cdcfda6964195ba70"
    end
  end

  def install
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      bin.install "aws-finops-linux-amd64" => "aws-finops"
    end

    if OS.mac?
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "aws-finops-darwin-amd64" => "aws-finops"
      end
    end
  end
end
