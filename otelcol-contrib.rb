class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.114.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.114.0/otelcol-contrib_0.114.0_linux_amd64.tar.gz"
    sha256 "6a2f42f8a4d25129441ebf32f0be99729d9a3a2a26380dee6ed31b16d2edd5b1"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.114.0/otelcol-contrib_0.114.0_darwin_arm64.tar.gz"
      sha256 "59022f4a465727945b6c30ae4362288df545c9aa6afbaffc0416d767724890d0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.114.0/otelcol-contrib_0.114.0_darwin_amd64.tar.gz"
      sha256 "dd30932528f9121411294fc2e0c6e0a24aa618fc45d86ba28f20dc6b58a1bb01"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
