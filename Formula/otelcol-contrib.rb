class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.133.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.133.0/otelcol-contrib_0.133.0_linux_amd64.tar.gz"
    sha256 "5ffceed6310cba814cdbae857a3e58b6107ac5fe32295dd98db9e07efdb8f1ad"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.133.0/otelcol-contrib_0.133.0_darwin_arm64.tar.gz"
      sha256 "273b536250f56e333b78ca34119f764d40872a54700e7f722654aa18263c29c3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.133.0/otelcol-contrib_0.133.0_darwin_amd64.tar.gz"
      sha256 "756879c18fffdaa9b761d7fbf2fae8570177f8c0e5b18ec88ca60fa032928783"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
