class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.128.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.128.0/otelcol-contrib_0.128.0_linux_amd64.tar.gz"
    sha256 "09b1332e29968bacdb7ce564073302ef9567c71919842544b4382f0f15456fd6"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.128.0/otelcol-contrib_0.128.0_darwin_arm64.tar.gz"
      sha256 "6a5e030ccd6152facb1570a5bb5f794473fac39c6afaa48492f426276c291376"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.128.0/otelcol-contrib_0.128.0_darwin_amd64.tar.gz"
      sha256 "a1e8cef1a5770b9c7f5a41cff24945faa53bfccbae38512b62a1af119887d7d4"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
