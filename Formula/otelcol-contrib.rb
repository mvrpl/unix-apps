class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.158.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.158.0/otelcol-contrib_0.158.0_linux_amd64.tar.gz"
    sha256 "7623348c295ec7b00d86c30040a30730f7e3537e813b34c880c1d5abb9bbe8d5"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.158.0/otelcol-contrib_0.158.0_darwin_arm64.tar.gz"
      sha256 "e2b68ae0eeb165795c1c9aecc29d24fe91790dd6ec7d200dd7e5a8b226a2f636"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.158.0/otelcol-contrib_0.158.0_darwin_amd64.tar.gz"
      sha256 "c55e9dfa2e87bafc35bc0a34c4956a4501ee4680155df96d815dd89a540b38d1"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
