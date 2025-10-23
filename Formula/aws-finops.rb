class AwsFinops < Formula
  desc "Um painel de custos e recursos da AWS"
  homepage "https://github.com/diillson/aws-finops-dashboard-go"
  version "1.2.2"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.2.2/aws-finops-linux-amd64"
    sha256 "6030d4c59dc6dfa16ce16af4f093df8e6d608dfee7afa1e0dbd74fb71813b9bd"
  end

  if OS.mac?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.2.2/aws-finops-darwin-amd64"
      sha256 "c2499639106b265646053964390dbfa94e76428de70ff5fbf51187fff802f0da"
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
