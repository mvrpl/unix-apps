class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.164.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.164.0/otelcol-contrib_0.164.0_linux_amd64.tar.gz"
    sha256 "f0c1ce9f661399beb4a58b711924716e08ea70c3802db0715fcfde3cbbada2d4"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.164.0/otelcol-contrib_0.164.0_darwin_arm64.tar.gz"
      sha256 "af6a0c56886e3cc36ccebe849fa167bad2bc47a97a48fd8497a0d6f93d0cf73a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.164.0/otelcol-contrib_0.164.0_darwin_amd64.tar.gz"
      sha256 "b53ab416e9a90625c1453692f1d3a3c4eba72904424e31516866f73064b65d4f"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
