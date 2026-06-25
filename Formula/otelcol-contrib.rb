class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.155.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.155.0/otelcol-contrib_0.155.0_linux_amd64.tar.gz"
    sha256 "229cfddeb0621d2a011bfd1c8894335479e46349b93a0cfbccbe653443a3ec95"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.155.0/otelcol-contrib_0.155.0_darwin_arm64.tar.gz"
      sha256 "dc9ecd5243bc632a2901d028bfc7a705fb6317b269c9514b5f8187b80caf8c56"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.155.0/otelcol-contrib_0.155.0_darwin_amd64.tar.gz"
      sha256 "7a792b03c6c7d8cfa1b67c08fd9d0c5c021a1387f926ecba92b9cfbec2d0f80e"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
