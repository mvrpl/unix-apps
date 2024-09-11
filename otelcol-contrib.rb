class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.109.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.109.0/otelcol-contrib_0.109.0_linux_amd64.tar.gz"
    sha256 "364b561ed6b4379382f86254d9a9bec8cd2a134e0fb65c7591e46a8d868d5d87"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.109.0/otelcol-contrib_0.109.0_darwin_arm64.tar.gz"
      sha256 "5cd4d37eb5a0f55c42b3da40fd2537a3c628be152c8418dc26836bcd9ef61e47"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.109.0/otelcol-contrib_0.109.0_darwin_amd64.tar.gz"
      sha256 "a3175a8639b8e0998f4a408858288ec560df3a33d077c633e4b409831061190a"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
