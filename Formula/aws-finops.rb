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
    sha256 "6745233c8e1fde3491689713ec11e4674bb587d993841a80c21ea13dd40b84bd"
  end

  if OS.mac?
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/diillson/aws-finops-dashboard-go/releases/download/v1.0.0/aws-finops-darwin-amd64"
      sha256 "6e9451add7104a5806782e93c49ad44d877c0dafa42294a1d7d3e0ffc0df0c8e"
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
