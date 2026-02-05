class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.145.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.145.0/otelcol-contrib_0.145.0_linux_amd64.tar.gz"
    sha256 "3d7f326c860ba32ee752e6703116ef6a1406b8161f282b0ce295c67ce841c236"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.145.0/otelcol-contrib_0.145.0_darwin_arm64.tar.gz"
      sha256 "9b708ec430640d0ef13aa51ab116017cdc7259d0a411da7ef35340f88f13811b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.145.0/otelcol-contrib_0.145.0_darwin_amd64.tar.gz"
      sha256 "6766d606ea8364b9c8e10cd84e6a6502df0971d397c7af457922810a01c67ce3"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
