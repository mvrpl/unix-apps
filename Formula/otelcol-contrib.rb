class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.156.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.156.0/otelcol-contrib_0.156.0_linux_amd64.tar.gz"
    sha256 "ee70d7b1221be8a9cc4700f48bf985c04b1ab8aaeef24409fe79623849e2f9f2"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.156.0/otelcol-contrib_0.156.0_darwin_arm64.tar.gz"
      sha256 "f5e3a6fbc8cca5e9fc9ce642c5ca16da084b4b6fea3f38a8ad29eea69ddf8e0f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.156.0/otelcol-contrib_0.156.0_darwin_amd64.tar.gz"
      sha256 "f463ace0f14f76607adc68cb265c2235e33db636ed99f7934b9699e462007d5e"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
