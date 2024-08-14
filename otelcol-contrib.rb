class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.107.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.107.0/otelcol-contrib_0.107.0_linux_amd64.tar.gz"
    sha256 "791620396fff8f6df461ea689d597632307599ba1600f70803f3317225656f6c"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.107.0/otelcol-contrib_0.107.0_darwin_arm64.tar.gz"
      sha256 "9b0a5df51a340890549c9af2e0de9063a1b9f471214861da93bc05f2d02d6747"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.107.0/otelcol-contrib_0.107.0_darwin_amd64.tar.gz"
      sha256 "ac8ad262c1093d2e511583dd09732a867c69c0bc2f1361bfd1150d09fcbbee48"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
