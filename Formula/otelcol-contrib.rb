class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.121.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.121.0/otelcol-contrib_0.121.0_linux_amd64.tar.gz"
    sha256 "f92e7945b5d2ca160b80f2fd2760a3bfc0db065945bafb5e0f5f80c3a6eebf22"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.121.0/otelcol-contrib_0.121.0_darwin_arm64.tar.gz"
      sha256 "bf0eba4b80062d5f3dca90a54a4ccfcaabfddb2d76dfce9b78aa22e19aca045f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.121.0/otelcol-contrib_0.121.0_darwin_amd64.tar.gz"
      sha256 "ef8f9e94cf8adc45409f0cb88847206d2d3be8f27cf0cb0839749b6daa9a4b79"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
