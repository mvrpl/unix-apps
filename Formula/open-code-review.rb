class OpenCodeReview < Formula
  desc "Open Code Review brings Alibaba's battle-tested code review Agent into your workflow"
  homepage "https://open-codereview.ai"
  version "1.14.1"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/alibaba/open-code-review'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.14.1/opencodereview-linux-arm64"
      sha256 "fc2e05595ab0484d07b223813b4f44167e8ead744e1ff6ddf3ecd3535c2a06b4"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.14.1/opencodereview-linux-amd64"
      sha256 "7d31862a1b9c6f9cea02141673f7b814071d2f36f1a9e6ce2f14d39d959229f4"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.14.1/opencodereview-darwin-arm64"
      sha256 "5a7be8517ed81032f8ec91806d86c696911140e7cab17607f3345245404c7c3a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.14.1/opencodereview-darwin-amd64"
      sha256 "bd650ba4f48a8e26776dbde841347f4fb01b6e16f52338d11024c2afb5da3b44"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            bin.install "opencodereview-linux-arm64" => "ocr"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "opencodereview-linux-amd64" => "ocr"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            bin.install "opencodereview-darwin-arm64" => "ocr"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "opencodereview-darwin-amd64" => "ocr"
        end
    end
  end
end
