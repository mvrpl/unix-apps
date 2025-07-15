class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.130.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.130.0/otelcol-contrib_0.130.0_linux_amd64.tar.gz"
    sha256 "292ac0d698e80282ec3d848238ffd6976c3cb97c3c169dec955754efc2293e71"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.130.0/otelcol-contrib_0.130.0_darwin_arm64.tar.gz"
      sha256 "f851c6c59a896badcbdb76b40571f8c70f9df0d1af32834784ba7240be1bc774"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.130.0/otelcol-contrib_0.130.0_darwin_amd64.tar.gz"
      sha256 "092ab65031d08dec2c7a22fc80551e791a3f14bee0b3d04a26f84366da39d0f3"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
