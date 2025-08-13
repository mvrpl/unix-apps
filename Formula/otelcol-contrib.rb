class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.132.2"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.2/otelcol-contrib_0.132.2_linux_amd64.tar.gz"
    sha256 "9ef24a803a97624ea4f941996feb4540b76d7cd85926b5e2bcdcb90a4a1d254a"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.2/otelcol-contrib_0.132.2_darwin_arm64.tar.gz"
      sha256 "00df4c248002a7e1e50086270095e5e42de4191a2ff4a26b485f8b24e613eea4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.2/otelcol-contrib_0.132.2_darwin_amd64.tar.gz"
      sha256 "7d044d9317df9c2842943b97a78ba10b26d34e865cf830a12860f58f2e873aa2"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
