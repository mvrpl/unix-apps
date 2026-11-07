class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.165.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.165.0/otelcol-contrib_0.165.0_linux_amd64.tar.gz"
    sha256 "bd6e73d94bf3359ad6fac25529a8ee308adb9b0b8a0e8af034ed3891fbe5aa33"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.165.0/otelcol-contrib_0.165.0_darwin_arm64.tar.gz"
      sha256 "f9a0ed310e9beeb0fabca9d9c24bd0d3467f6339e3207710dbd66a6adf1298f6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.165.0/otelcol-contrib_0.165.0_darwin_amd64.tar.gz"
      sha256 "7d14e5c14bcb930d55f2bd5d3fbb3734be5fd2889698488e65e488efda5473c9"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
