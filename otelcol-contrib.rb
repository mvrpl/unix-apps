class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.103.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.103.1/otelcol-contrib_0.103.1_linux_amd64.tar.gz"
    sha256 "1ac485c3cf74d94a2a453d3bb4654ffef32021f5ed840089b755a30b5107e1d7"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.103.1/otelcol-contrib_0.103.1_darwin_arm64.tar.gz"
      sha256 "6ded41ce35e19e05f4bc949ad35addde65f2147dd83e32aa2489758d23decc01"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.103.1/otelcol-contrib_0.103.1_darwin_amd64.tar.gz"
      sha256 "03e2172526631edd9d61bc72ef43d1468fb96589e00135ff5158e8db90511b9e"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
