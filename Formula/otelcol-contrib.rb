class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.151.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.151.0/otelcol-contrib_0.151.0_linux_amd64.tar.gz"
    sha256 "5230d1e1ad0599a396427fc4c4dab6add94b008bc4375d393b907092a50908b2"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.151.0/otelcol-contrib_0.151.0_darwin_arm64.tar.gz"
      sha256 "ee90da0191ec644d72c407a2b25d7451892d03fdd3fb67aa020b19f32a599bc4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.151.0/otelcol-contrib_0.151.0_darwin_amd64.tar.gz"
      sha256 "2c080d5c92e2742de6f0be1097f3c46446e07f666d892b7708764d28958e8d86"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
