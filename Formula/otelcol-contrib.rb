class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.120.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.120.0/otelcol-contrib_0.120.0_linux_amd64.tar.gz"
    sha256 "81bf885bc9a86705feb3c113c5a356571390e3601eb651ffcf2b3428f6571adb"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.120.0/otelcol-contrib_0.120.0_darwin_arm64.tar.gz"
      sha256 "8e3da7b807c6b22077892e731e12dd969dada2643d85641d87324900385d9bcd"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.120.0/otelcol-contrib_0.120.0_darwin_amd64.tar.gz"
      sha256 "9e2716f9b1a8dc47790d5de2e001def5bf30ee9639e23728ff481bfbdbf98613"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
