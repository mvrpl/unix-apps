class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.102.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.102.1/otelcol-contrib_0.102.1_linux_amd64.tar.gz"
    sha256 "e1aedaffc13f65600486ec87c50bf2e52fa748501338f73433180b801b1743a1"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.102.1/otelcol-contrib_0.102.1_darwin_arm64.tar.gz"
      sha256 "86e69cb37e4159840c027a6b2d62418ea8e05a05d082dfaa6af823f068033680"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.102.1/otelcol-contrib_0.102.1_darwin_amd64.tar.gz"
      sha256 "e3e9191075d3e184c85548512852f82381317922a229cff41250ad0917745349"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
