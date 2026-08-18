class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.159.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.159.0/otelcol-contrib_0.159.0_linux_amd64.tar.gz"
    sha256 "9d589f6349f01179957a2052bc7307a99db2efc971e14e00575941a77122eaaf"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.159.0/otelcol-contrib_0.159.0_darwin_arm64.tar.gz"
      sha256 "7e317b75b1b087ba2150bf95d79e39a394d0d091f1231af6bbebee895d200375"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.159.0/otelcol-contrib_0.159.0_darwin_amd64.tar.gz"
      sha256 "c683fc414117b8477794dcd7591e84e61cbef1e2ff8817afb6fd622e7fb5c0d9"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
