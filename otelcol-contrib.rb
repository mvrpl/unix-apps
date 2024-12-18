class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.116.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.116.1/otelcol-contrib_0.116.1_linux_amd64.tar.gz"
    sha256 "7dbe6063bb158910beecb4699688401dd42241202e27a0a8c7a111852f3ed78b"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.116.1/otelcol-contrib_0.116.1_darwin_arm64.tar.gz"
      sha256 "a4eec291e91c9771c46b18aa092a104d1c5c1ae1076b31400e2c502e250e95ec"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.116.1/otelcol-contrib_0.116.1_darwin_amd64.tar.gz"
      sha256 "961257162cd073adb163ad27bedfca06fc84d7981e15fb097fb9fd50e2a030bd"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
