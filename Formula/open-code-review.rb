class OpenCodeReview < Formula
  desc "Open Code Review brings Alibaba's battle-tested code review Agent into your workflow"
  homepage "https://open-codereview.ai"
  version "1.13.11"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/alibaba/open-code-review'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.11/opencodereview-linux-arm64"
      sha256 "aaab77fc1825bb7de42d62bde1803ef316bd5d54c00bbed512a029c570c76180"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.11/opencodereview-linux-amd64"
      sha256 "7347e29ea8b26a8a5ed2778e95ac3e2954cc1695d34f70dfd9a4e8c8e146f55f"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.11/opencodereview-darwin-arm64"
      sha256 "ae77e6b696ba0a4ac15307bd9f04c955dba94ac23eadf319efdd406271530f13"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.11/opencodereview-darwin-amd64"
      sha256 "cea0ae7ba9f93b5a2f2cbb2deca33be4c49b38cddbadc6f0d419cb6893766a2b"
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
