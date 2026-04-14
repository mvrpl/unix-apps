class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.150.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.150.1/otelcol-contrib_0.150.1_linux_amd64.tar.gz"
    sha256 "82d87c52ee28c9b8753b475494f23ab041f98e6d73a20f4ecbff248d88e29a33"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.150.1/otelcol-contrib_0.150.1_darwin_arm64.tar.gz"
      sha256 "8a1931a19d64c2eacbddc47e5e316758df06cf9e201d86e2d4779c8480f57dca"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.150.1/otelcol-contrib_0.150.1_darwin_amd64.tar.gz"
      sha256 "c014d33c272b081a75d672d859c16eaae50443bc51b6704c04860881ab0c932c"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
