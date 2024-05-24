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
    sha256 "d2311243142bb2e9681d6f302f6d3c0c385a876a5dcdb7910d3092b3bcbd9fb1"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.100.0/otelcol-contrib_0.100.0_darwin_arm64.tar.gz"
      sha256 "6b58524b937d36595acc004b3e0c978eacd6791bb9f87ab4d81100a9eff66662"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.101.0/otelcol-contrib_0.101.0_darwin_amd64.tar.gz"
      sha256 "449584c81269240ca812804f820ef649c7b3aa82306586fbe79e6e648ade04d5"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
