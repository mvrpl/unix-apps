class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.129.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.129.1/otelcol-contrib_0.129.1_linux_amd64.tar.gz"
    sha256 "6fe3531656660a8f145872cc1502371cb20e6d7da70fdc9a64bf6ebdaba20403"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.129.1/otelcol-contrib_0.129.1_darwin_arm64.tar.gz"
      sha256 "bd5c2acb501d525da72a55136894a619e3539026640368ff8249d5829cd51f21"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.129.1/otelcol-contrib_0.129.1_darwin_amd64.tar.gz"
      sha256 "ebacdb322c1a9adab9b1bc9d118f1a25278df30419a45ce345bbf05c77c680ba"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
