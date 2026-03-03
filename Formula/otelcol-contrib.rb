class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.147.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.147.0/otelcol-contrib_0.147.0_linux_amd64.tar.gz"
    sha256 "17cc9a8f2e44e80ceff0e0647aec18b28a6b1b17823040e362ddc4a9fd017ccc"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.147.0/otelcol-contrib_0.147.0_darwin_arm64.tar.gz"
      sha256 "3b79e51fbd0a1eecba7c0f90f4022cf5b498ee7f19d34674f4eef8b0f1f24162"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.147.0/otelcol-contrib_0.147.0_darwin_amd64.tar.gz"
      sha256 "f0075b96fcc9d1c085ae76d7206cf2c52080a3237eee4ce36218cafb2c6cd9d5"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
