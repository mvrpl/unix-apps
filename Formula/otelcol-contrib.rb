class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.135.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.135.0/otelcol-contrib_0.135.0_linux_amd64.tar.gz"
    sha256 "43132748eb0effb56b9d508ca789149684bf7ab6ade5d65cd0b22c4d265a30c0"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.135.0/otelcol-contrib_0.135.0_darwin_arm64.tar.gz"
      sha256 "a6c6b21b85d469b7fcbade017b3e8d39cd88580f3ed5c972542a223771b2f485"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.135.0/otelcol-contrib_0.135.0_darwin_amd64.tar.gz"
      sha256 "d5db819e4c2065ca94cb49e34a468ae622114555e1859aa1a077ad155fddf1ff"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
