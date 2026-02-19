class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.146.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.146.1/otelcol-contrib_0.146.1_linux_amd64.tar.gz"
    sha256 "a2e866f21d482f9035d8898337b4e473578ae2a11d57d5265818bb460ca7b0aa"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.146.1/otelcol-contrib_0.146.1_darwin_arm64.tar.gz"
      sha256 "70c82e04ffa20b007d8a402c9f3838df7db3965a5e660039ae0a81c4db0c8b47"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.146.1/otelcol-contrib_0.146.1_darwin_amd64.tar.gz"
      sha256 "760765af0b021c150e36c7aaa7f2bbb9e1266625cb8d8d35e6b4e32c3e8ba04a"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
