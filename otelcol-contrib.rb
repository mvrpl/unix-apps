class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.103.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.103.0/otelcol-contrib_0.103.0_linux_amd64.tar.gz"
    sha256 "f5b6547ee975ff66cbdbaa501779aece6e17f79a3f0447479b0ae1ba4d874f48"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.103.0/otelcol-contrib_0.103.0_darwin_arm64.tar.gz"
      sha256 "f2fbba6f97ab7d6be050eb9c70e266be4cc64632822962b3dca97c040337dad3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.103.0/otelcol-contrib_0.103.0_darwin_amd64.tar.gz"
      sha256 "9d34c61e345492321b1f0da2a7d3f6af44e6e6ad781d72bd45c0649257849682"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
