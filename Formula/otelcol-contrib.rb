class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.160.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.160.0/otelcol-contrib_0.160.0_linux_amd64.tar.gz"
    sha256 "7bb60c584c241c86261c2b8697cd3725dd8c56691f5ad5d98454eaa005b47b0c"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.160.0/otelcol-contrib_0.160.0_darwin_arm64.tar.gz"
      sha256 "ceb5309ba16f2587dbef765d54e15c803354d038b0495b0b691e1eb9876d17c9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.160.0/otelcol-contrib_0.160.0_darwin_amd64.tar.gz"
      sha256 "1576c3049c1fd4e8172d9817313a0129f4d2a1004aa653987d765df048e1e959"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
