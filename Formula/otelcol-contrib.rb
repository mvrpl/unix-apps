class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.132.4"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.4/otelcol-contrib_0.132.4_linux_amd64.tar.gz"
    sha256 "c4c836a108155718ce715144af4f52d30e2f26d230a67d037071887cce1d3647"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.4/otelcol-contrib_0.132.4_darwin_arm64.tar.gz"
      sha256 "c0d24e0555ba795db759fa310ab059d86921b675150fda3b9b0f20e0691327ea"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.4/otelcol-contrib_0.132.4_darwin_amd64.tar.gz"
      sha256 "59f8ae33b17e36c528341b47d88627f6231a35e1e79cc64afe1daa15a1b50dac"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
