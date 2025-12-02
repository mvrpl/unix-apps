class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.141.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.141.0/otelcol-contrib_0.141.0_linux_amd64.tar.gz"
    sha256 "cb13377048b91d69ff5cbc342e2af35363ccb6e7040f8f4eff58472a7f3719be"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.141.0/otelcol-contrib_0.141.0_darwin_arm64.tar.gz"
      sha256 "62a412b7103465defed64de51f9ee5f97c166397d4fe91b3aa14d371be44de83"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.141.0/otelcol-contrib_0.141.0_darwin_amd64.tar.gz"
      sha256 "975136084e8c5dc0bd66f5b192b812e8266406bfcd7afa43e2b8d5d484bd3573"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
