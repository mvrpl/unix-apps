class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.117.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.117.0/otelcol-contrib_0.117.0_linux_amd64.tar.gz"
    sha256 "90710c909a30fc3b89dd0e389c13f9e57ebbb87d6a0dc51fdde0bf03499a5f25"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.117.0/otelcol-contrib_0.117.0_darwin_arm64.tar.gz"
      sha256 "9be664c5445f6cf0e6240ba82002716735697d78fcb148677b88ec9f2df675d2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.117.0/otelcol-contrib_0.117.0_darwin_amd64.tar.gz"
      sha256 "08dfafdc2859ef073060fd2e646bc57cd1089ed5dea4c8d110466117b629c7f5"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
