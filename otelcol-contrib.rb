class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.113.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.113.0/otelcol-contrib_0.113.0_linux_amd64.tar.gz"
    sha256 "6b0560bb51e12c8143215b4d565bab2cae646533451bf3b7069ee480490822fb"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.113.0/otelcol-contrib_0.113.0_darwin_arm64.tar.gz"
      sha256 "1356f80ba09d5858d9932a11e3c648828ef54cd53e593b68d9b81fa4c2308448"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.113.0/otelcol-contrib_0.113.0_darwin_amd64.tar.gz"
      sha256 "c64f6e4c1314c34ae24d71bad2aed67daa20e4ad5485e749450479d90a55defb"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
