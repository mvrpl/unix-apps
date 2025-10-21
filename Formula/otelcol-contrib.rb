class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.138.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.138.0/otelcol-contrib_0.138.0_linux_amd64.tar.gz"
    sha256 "9f6462ffa45829bce9e69a2995932a521e9d40f0658eddbe27f6e262c2e82b1d"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.138.0/otelcol-contrib_0.138.0_darwin_arm64.tar.gz"
      sha256 "7aa1270c6c8914f87d7e93499f10fd360ef583f2164e0a49f270171b16bb274c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.138.0/otelcol-contrib_0.138.0_darwin_amd64.tar.gz"
      sha256 "c0d2d7ca9cdab2c285fea6631881da7c6475976816d5d4b4c0714b8f3fbcb83c"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
