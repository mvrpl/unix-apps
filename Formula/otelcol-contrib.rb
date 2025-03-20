class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.122.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.122.1/otelcol-contrib_0.122.1_linux_amd64.tar.gz"
    sha256 "3f41066848a808209d942e4ea04dace0da38f16847368d4dee792c9aac034e34"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.122.1/otelcol-contrib_0.122.1_darwin_arm64.tar.gz"
      sha256 "da69f6ae690a4369f9e14f98cb8bde45b565b47d623850043aff86ba0094f032"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.122.1/otelcol-contrib_0.122.1_darwin_amd64.tar.gz"
      sha256 "fcf8fc48a2e7d26ec7114ec688df7459741910b143ccfc1dfca26db29e603252"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
