class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.143.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.143.1/otelcol-contrib_0.143.1_linux_amd64.tar.gz"
    sha256 "e6d26dde5e43d09fdde6289d8afcdf057687314a35813006c4e65b23a3f95356"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.143.1/otelcol-contrib_0.143.1_darwin_arm64.tar.gz"
      sha256 "2afeaf0762cf9657525b0e6a060a38fb8f8e64ebc1787fccf8a5ad7e3803ff55"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.143.1/otelcol-contrib_0.143.1_darwin_amd64.tar.gz"
      sha256 "4a243e0060b084b9c190b1226d703bf8e960a68765d7590576e250fa1dbcc837"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
