class AwsFinops < Formula
  desc "Um painel de custos e recursos da AWS"
  homepage "https://github.com/diillson/aws-finops-dashboard-go"
  version "1.0.0"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.0.0/aws-finops-linux-amd64"
    sha256 ""
  end

  if OS.mac?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.0.0/aws-finops-darwin-amd64"
      sha256 ""
    end
  end

  depends_on "less"

  def install
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      bin.install " aws-finops-linux-amd64" => "aws-finops"
    end

    if OS.mac?
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install " aws-finops-darwin-amd64" => "aws-finops"
      end
    end
  end
end
