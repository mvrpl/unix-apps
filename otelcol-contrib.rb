class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.104.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.104.0/otelcol-contrib_0.104.0_linux_amd64.tar.gz"
    sha256 "7492306eac9804239c9d284adeec221f3f5f30123bc7a457de52b5ac3abd52e5"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.104.0/otelcol-contrib_0.104.0_darwin_arm64.tar.gz"
      sha256 "cf50fb4d68a7bf5250dbb6a92fa206172b2ad4f340c71cdd986eb2777cebbb91"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.104.0/otelcol-contrib_0.104.0_darwin_amd64.tar.gz"
      sha256 "4a87cb191f2b1a98b2c8819ec47bb2ca285ef3c1d820996f41eab5e8505036f8"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
