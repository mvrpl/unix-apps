class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.157.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.157.0/otelcol-contrib_0.157.0_linux_amd64.tar.gz"
    sha256 "d33177515a244a2393f03ffd66ab3e68a8fc11a56bc145ec4d0ca2644ee95504"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.157.0/otelcol-contrib_0.157.0_darwin_arm64.tar.gz"
      sha256 "6c03308935573712a795b4229f756bc4288bbbb13850604f3c7287868af84d4b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.157.0/otelcol-contrib_0.157.0_darwin_amd64.tar.gz"
      sha256 "e11e7482144c3ac1eb1f612d3d175589435cad968a791d6ef5c73be43e1b8c34"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
