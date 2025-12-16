class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.142.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.142.0/otelcol-contrib_0.142.0_linux_amd64.tar.gz"
    sha256 "e150a30171669ce7d0132fdf89b6a2f165fa434c87fb8086adff7993bfbd5c1a"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.142.0/otelcol-contrib_0.142.0_darwin_arm64.tar.gz"
      sha256 "6a009027d70baeb756569ba25e13989cd5d62ada3f47749b14372f92df38fb77"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.142.0/otelcol-contrib_0.142.0_darwin_amd64.tar.gz"
      sha256 "495ac180cd71a9f2e47bbe4763d5cde9222f3b134039e18de4729aaf286b924b"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
