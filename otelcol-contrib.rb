class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.102.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.102.1/otelcol-contrib_0.102.1_linux_amd64.tar.gz"
    sha256 "326772622016f7ff7e966a7ae8a0f439dc49a3d80b6d79a82b62608af447e851"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.102.1/otelcol-contrib_0.102.1_darwin_arm64.tar.gz"
      sha256 "f9564560798ac5c099885903f303fcda97b7ea649ec299e075b72f3805873879"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.102.1/otelcol-contrib_0.102.1_darwin_amd64.tar.gz"
      sha256 "5456734e124221e7ff775c52bd3693d05b3fac43ebe06b22aa5f220f1962ed8c"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
