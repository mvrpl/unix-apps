class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.163.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.1/otelcol-contrib_0.163.1_linux_amd64.tar.gz"
    sha256 "e93e6fd2b59427420a9e8eba5b9e78260df6d21e95283a7298084d2aa07f9df7"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.1/otelcol-contrib_0.163.1_darwin_arm64.tar.gz"
      sha256 "c25aa7abb438d0474ffec02b0abeb04aeb688ad72e083cc1af0bed1f84dae856"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.163.1/otelcol-contrib_0.163.1_darwin_amd64.tar.gz"
      sha256 "25d9caed08fe1403da652563eba451fcc5c64bffb16448b9a164235a0727b3c8"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
