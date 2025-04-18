class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.124.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.124.1/otelcol-contrib_0.124.1_linux_amd64.tar.gz"
    sha256 "89b5d28147d501b2d4aa4feed45291a97f801ecb749430235839c79cf18d2c77"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.124.1/otelcol-contrib_0.124.1_darwin_arm64.tar.gz"
      sha256 "d5d96c8ac06ce0af19aefd21aef82a81aab6688574ad991fa7849d66b140d7cd"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.124.1/otelcol-contrib_0.124.1_darwin_amd64.tar.gz"
      sha256 "2d4d221a304ad972ef1158afa3fd8f79b4be32162cedc67325eda6b1013bc432"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
