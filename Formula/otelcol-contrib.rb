class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.134.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.134.1/otelcol-contrib_0.134.1_linux_amd64.tar.gz"
    sha256 "c54842030d755ea5f3fd4ad7ab6b3b4be9a0a7d8856ce9b6e15dd12e8c2d38cf"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.134.1/otelcol-contrib_0.134.1_darwin_arm64.tar.gz"
      sha256 "295240c82709dba37dc874adce44496193dea15f8d9ee401e8aa281feed6b664"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.134.1/otelcol-contrib_0.134.1_darwin_amd64.tar.gz"
      sha256 "a7eaef5d0139f6b929a01f31abdda0f6d107cafe4bf5b4d86b26af93762fe70e"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
