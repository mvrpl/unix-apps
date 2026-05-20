class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.152.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.152.1/otelcol-contrib_0.152.1_linux_amd64.tar.gz"
    sha256 "2a01ac12b4a16dea39be1cfebd3477a7bc63c5fe6068b6cb8eaf25d1a16be829"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.152.1/otelcol-contrib_0.152.1_darwin_arm64.tar.gz"
      sha256 "32778c05c60d1387ef90fb0e576d0a27c8197e52a82d57caeacea98c9b532161"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.152.1/otelcol-contrib_0.152.1_darwin_amd64.tar.gz"
      sha256 "6e5127fc74c0b4b302c9f1149edcc3a47f6644fe201f8c1d7a8ebeea21525683"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
