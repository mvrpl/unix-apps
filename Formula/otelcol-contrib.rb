class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.163.2"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.2/otelcol-contrib_0.163.2_linux_amd64.tar.gz"
    sha256 "cc19dd6a1b85ca694ef16655688e597f693d0e24d2baecdd50e2db597819eeff"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.2/otelcol-contrib_0.163.2_darwin_arm64.tar.gz"
      sha256 "ae0dff18926bc3f1e3ef4d1633c4ad4326781f302da2ba5be2ce215ba86e4b9e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.2/otelcol-contrib_0.163.2_darwin_amd64.tar.gz"
      sha256 "296bcc386250563fa547a287aac67b47bb124656d11d9bf40dbc60a883455e6c"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
