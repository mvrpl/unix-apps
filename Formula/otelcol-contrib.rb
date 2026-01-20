class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.144.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.144.0/otelcol-contrib_0.144.0_linux_amd64.tar.gz"
    sha256 "4429eecfb311e35f846af453d46c0a8a72e6773489e8105fb049f5bc9edec022"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.144.0/otelcol-contrib_0.144.0_darwin_arm64.tar.gz"
      sha256 "605cdc88c65b23d7e0c373d56a1f411da427a978567ab186050a27791f7779b0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.144.0/otelcol-contrib_0.144.0_darwin_amd64.tar.gz"
      sha256 "0de9275b11bf6285648470fb8efec5612cb422f495df7a3fef93cd8cd647ed0e"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
