class AwsFinops < Formula
  desc "Um painel de custos e recursos da AWS"
  homepage "https://github.com/diillson/aws-finops-dashboard-go"
  version "1.2.1"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.2.1/aws-finops-linux-amd64"
    sha256 "ec95a031d19d178dc395212ffe1c11f6be98a333ecad56a32a60bf4e3b296f4e"
  end

  if OS.mac?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.2.1/aws-finops-darwin-amd64"
      sha256 "a5e8dd129f806a3e45221c0f3a09221919964cd85befd2d9bbc0e3100ba7a6ea"
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
