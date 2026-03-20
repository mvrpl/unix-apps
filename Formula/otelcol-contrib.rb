class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.148.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.148.0/otelcol-contrib_0.148.0_linux_amd64.tar.gz"
    sha256 "224be33baa9eb534838e3d742d5327eff6a6bb60cdf4a16daf9c4e70d438fe00"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.148.0/otelcol-contrib_0.148.0_darwin_arm64.tar.gz"
      sha256 "9fa3074e075f49b3c82cca957cfa367f097b4b56e5583105613beb8ab5a6ffa1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.148.0/otelcol-contrib_0.148.0_darwin_amd64.tar.gz"
      sha256 "ebd06dc7f098a5e4d7c705a6228d724c9ea3b040f8435fad77846bc886df0c1f"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
