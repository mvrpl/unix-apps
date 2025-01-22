class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.118.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.118.0/otelcol-contrib_0.118.0_linux_amd64.tar.gz"
    sha256 "2a3dc975026e68d409658e9348e573593a194702c4af7acb8b443a0ef3c6cd7e"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.118.0/otelcol-contrib_0.118.0_darwin_arm64.tar.gz"
      sha256 "c7c4cafea3b799ed0f22f2e179c8f8b5fa9c1880143aa5120da2377dbedf12af"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.118.0/otelcol-contrib_0.118.0_darwin_amd64.tar.gz"
      sha256 "e6e54ede8064b6f26ce94890a11f3f02355dd0971ed4036a594889928c7ed8d8"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
