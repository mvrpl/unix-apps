class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.132.3"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.3/otelcol-contrib_0.132.3_linux_amd64.tar.gz"
    sha256 "cb9db3a4b9e9d5fe6c4b3e2fe51f3ff5157930526c91d207ece7ad9dd69b4d11"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.3/otelcol-contrib_0.132.3_darwin_arm64.tar.gz"
      sha256 "a2014e1001d41af001875711b7d7fdb827ab98907453b89d310e0aabe31cf437"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.132.3/otelcol-contrib_0.132.3_darwin_amd64.tar.gz"
      sha256 "37ef42c8d4ea8506ffd5bd3c8b26f0489bbdcf102d6051bc42d2845a7086aad8"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
