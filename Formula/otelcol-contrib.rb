class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.124.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.124.0/otelcol-contrib_0.124.0_linux_amd64.tar.gz"
    sha256 "4fe107b8e586a8547f0bdaab76f98d5eaf1335b90a23228bc5a1532bd600e663"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.124.0/otelcol-contrib_0.124.0_darwin_arm64.tar.gz"
      sha256 "a06b7fe7de25702436ddd73ebea07a24f45741b1856993ec193d1c1fde52e8f6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.124.0/otelcol-contrib_0.124.0_darwin_amd64.tar.gz"
      sha256 "70966a3b97165442f03e552d34c3c87d92b8c677b419c6ebcb55fc1d0dbeb1df"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
