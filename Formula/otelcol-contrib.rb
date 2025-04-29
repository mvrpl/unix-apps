class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.125.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.125.0/otelcol-contrib_0.125.0_linux_amd64.tar.gz"
    sha256 "fd91a7ebefb529c14282ed7bcbc61ec2c3b0d81d5c114062cb898c72788caaeb"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.125.0/otelcol-contrib_0.125.0_darwin_arm64.tar.gz"
      sha256 "5498c95f742e687391ad692edc4414ea921b7104c3fa7ac13b60f602699ba9c8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.125.0/otelcol-contrib_0.125.0_darwin_amd64.tar.gz"
      sha256 "988289ec5563e971aa076495d9cac0d3d964c70ef039f135d57de9f4cfb25ff6"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
