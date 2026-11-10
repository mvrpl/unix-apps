class OpenCodeReview < Formula
  desc "Open Code Review brings Alibaba's battle-tested code review Agent into your workflow"
  homepage "https://open-codereview.ai"
  version "1.13.7"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/alibaba/open-code-review'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.7/opencodereview-linux-arm64"
      sha256 "f18be0e467aa23a5d9966b38fc0f89144b932970a2082800eacd4062b9257ffa"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.7/opencodereview-linux-amd64"
      sha256 "8c1ff786161b6dc0e8dcb06107f18bda8b6181b39ce573400add4a39f90cf19d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.7/opencodereview-darwin-arm64"
      sha256 "ce2eab495483f9b119992b48253a4e2f6969c27c3b02514350d9e7aa0083b4e8"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.7/opencodereview-darwin-amd64"
      sha256 "fa7b63f25e7002aec38e6980b071d1b53e6681aeb9e144b7bfe84833de5e3de6"
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
