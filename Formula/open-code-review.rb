class OpenCodeReview < Formula
  desc "Open Code Review brings Alibaba's battle-tested code review Agent into your workflow"
  homepage "https://open-codereview.ai"
  version "1.13.9"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/alibaba/open-code-review'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.9/opencodereview-linux-arm64"
      sha256 "76fcb0e5c6c40f5ac2c23537563de8ac3038831d5f54f800cc10896d9ee91d8c"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.9/opencodereview-linux-amd64"
      sha256 "2db294981624d6fae9bcfb4df7f9ebfd7f92c40b3a552873dff5887116931d3e"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.9/opencodereview-darwin-arm64"
      sha256 "a4e6fc65146475217450545d2ebc2e8ae2aab5ef0e609fc865c379235e1720c0"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.9/opencodereview-darwin-amd64"
      sha256 "2044f04f4195240ed0a70f54b8c1d5ff3a69a8ce2d14712dccffa7a4f4039e06"
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
