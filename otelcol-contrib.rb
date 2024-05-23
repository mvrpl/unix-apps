class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.101.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.100.0/otelcol-contrib_0.100.0_linux_amd64.tar.gz"
    sha256 "58474c2ae87fbc41a8acf20bfd3a4b82f2b13a26f767090062e42a6a857bfb89"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.101.0/otelcol-contrib_0.101.0_darwin_arm64.tar.gz"
      sha256 "6b58524b937d36595acc004b3e0c978eacd6791bb9f87ab4d81100a9eff66661"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.100.0/otelcol-contrib_0.100.0_darwin_amd64.tar.gz"
      sha256 "cd2ee4b88edafd2d4264f9e28834683c60dab21a46493b7398b806b43c7bee3a"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
