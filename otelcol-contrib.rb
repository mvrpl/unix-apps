class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.119.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.119.0/otelcol-contrib_0.119.0_linux_amd64.tar.gz"
    sha256 "4ee77545daaad658f7282bff98704bc1f31107890e2a2e1d4b1fc31da4648111"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.119.0/otelcol-contrib_0.119.0_darwin_arm64.tar.gz"
      sha256 "d56e8003c5d37ccee27ea35a3a392a6dcdc2b5e25c492a6ff5512a633c390798"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.119.0/otelcol-contrib_0.119.0_darwin_amd64.tar.gz"
      sha256 "8c67ef47afd44dc68e778dbb8933d98007534f5db48286516f9d66b9e635b441"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
