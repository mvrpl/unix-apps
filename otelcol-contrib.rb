class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.106.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.106.1/otelcol-contrib_0.106.1_linux_amd64.tar.gz"
    sha256 "3c9bfe94bd10b508e1483bd091434a49362e55420d5be609ab7d1d52fe88c52e"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.106.1/otelcol-contrib_0.106.1_darwin_arm64.tar.gz"
      sha256 "cff7996143c59290ae6f435d6943578bb696389fdca4e5add3a8fa74129aa3d3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.106.1/otelcol-contrib_0.106.1_darwin_amd64.tar.gz"
      sha256 "a796398ed14582085075b29b387efd5e2ce1e4b7f71626e02664653c9c03a427"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
