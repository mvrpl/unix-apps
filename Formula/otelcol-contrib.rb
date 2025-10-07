class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.137.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.137.0/otelcol-contrib_0.137.0_linux_amd64.tar.gz"
    sha256 "43ad70c08932b318d6ac389702424c16d473d2a44d8e793baeb5ae1ea19327cb"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.137.0/otelcol-contrib_0.137.0_darwin_arm64.tar.gz"
      sha256 "702a6280120733313cd02ceacb7c1ca7bd258296e33cc4277d4c5b02449a5035"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.137.0/otelcol-contrib_0.137.0_darwin_amd64.tar.gz"
      sha256 "757de6c820dbd0c14a9a1549cadc3fe836f086f91d2fb1da80d972cabbc27c50"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
