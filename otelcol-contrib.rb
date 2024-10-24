class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.112.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.112.0/otelcol-contrib_0.112.0_linux_amd64.tar.gz"
    sha256 "d255ed6a2425f5399b2b5a3b3aa13375c573462222eef917fb5ff3e6329d4ccc"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.112.0/otelcol-contrib_0.112.0_darwin_arm64.tar.gz"
      sha256 "0318a860f5670cb0a9d8214af02eafb8f60ea92425e74beabd729993e81710a2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.112.0/otelcol-contrib_0.112.0_darwin_amd64.tar.gz"
      sha256 "4f972b63eadcbcc96503feefe651a4c5b20aca4a886a9fab3ca2a308542702af"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
