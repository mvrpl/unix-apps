class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.105.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.105.0/otelcol-contrib_0.105.0_linux_amd64.tar.gz"
    sha256 "df6e07a7e531c87ec0d799d8f0a5b78d04eb2fcccb580fc70617357ba425b4a2"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.105.0/otelcol-contrib_0.105.0_darwin_arm64.tar.gz"
      sha256 "28731cced55b36b003cbd92e9b8f8b8cfdffcd07d8f48a8b72122b2c9e44f4e0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.105.0/otelcol-contrib_0.105.0_darwin_amd64.tar.gz"
      sha256 "ff7e4053f6e82538e82111603637b26b82512ca74246d5f80503d6d4295f7c76"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
