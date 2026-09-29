class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.162.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.162.0/otelcol-contrib_0.162.0_linux_amd64.tar.gz"
    sha256 "fcc063749f730f8c21fe29f2d340ff174f5f1c5885bd3156fb6c985a3036fcc3"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.162.0/otelcol-contrib_0.162.0_darwin_arm64.tar.gz"
      sha256 "d5e11974d2e4adac3cc001a25137aad52f6e77ec3034ba7735cac7c219a5f97a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.162.0/otelcol-contrib_0.162.0_darwin_amd64.tar.gz"
      sha256 "91a6e7a0f5e1981986c897db4535de5ba8d7fc45d4205809aecb9ebebf68c71c"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
