class OpenCodeReview < Formula
  desc "Open Code Review brings Alibaba's battle-tested code review Agent into your workflow"
  homepage "https://open-codereview.ai"
  version "1.13.8"
  license "Apache-2.0"

  livecheck do
    url 'https://github.com/alibaba/open-code-review'
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.8/opencodereview-linux-arm64"
      sha256 "f0417702dc1e69438f73c9fd2e5739c221d324a5e4d50cf9d6d839f05b1b7998"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.8/opencodereview-linux-amd64"
      sha256 "32187a8afa11b9c37fe549a0c879152e716496445a7eb67baa917d0103f22146"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.8/opencodereview-darwin-arm64"
      sha256 "21ea25d40a744b909906f316361049d174b761c111607394c7dcca4741151f64"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/alibaba/open-code-review/releases/download/v1.13.8/opencodereview-darwin-amd64"
      sha256 "a32c00865323762927468d52a1ee2714f041bd017ece1cc0c38eddd10ece0329"
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
