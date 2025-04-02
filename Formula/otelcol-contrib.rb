class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.123.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.123.1/otelcol-contrib_0.123.1_linux_amd64.tar.gz"
    sha256 "5362e106390ff2a35cc472e948e8c894e06277bfc8a1f7cbc49f1ee0aadd0b45"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.123.1/otelcol-contrib_0.123.1_darwin_arm64.tar.gz"
      sha256 "0f21e0935f89f67ce85d7cc129fa81a76f84bd50ade90edf89a6d44c0094c906"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.123.1/otelcol-contrib_0.123.1_darwin_amd64.tar.gz"
      sha256 "d2886d3cd1cc2ed2d752ad0974daf1e9c0b97f212777f927fb075ca35b0c2b27"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
