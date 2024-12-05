class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.115.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.115.1/otelcol-contrib_0.115.1_linux_amd64.tar.gz"
    sha256 "f64ffe60226d2b3517c4902ee912911576c91976b4c9d513d3771a3fdc145eb9"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.115.1/otelcol-contrib_0.115.1_darwin_arm64.tar.gz"
      sha256 "49a702a3e61ca5d38bd21c1a12d850d3dd442e07b5c361a9cb8fe8ba46e30e7b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.115.1/otelcol-contrib_0.115.1_darwin_amd64.tar.gz"
      sha256 "05906b6872ef7f596ab38ab44ad61586c8d6706492565a37c48ce8e94afb59c5"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
