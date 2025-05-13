class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.126.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.126.0/otelcol-contrib_0.126.0_linux_amd64.tar.gz"
    sha256 "c265172482e11827d3d6247036aabbd40a824d2e24b0766287b05a8ac9a9c508"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.126.0/otelcol-contrib_0.126.0_darwin_arm64.tar.gz"
      sha256 "cf5cfa747123b310aead82263f6f4e260e932d02c97dd124c29095ca1a12425a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.126.0/otelcol-contrib_0.126.0_darwin_amd64.tar.gz"
      sha256 "51fd3f2c6946852b67e3cfce29d7462f24150886171d7dffe7bf9f6688bdeae7"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
