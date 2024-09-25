class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.110.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.110.0/otelcol-contrib_0.110.0_linux_amd64.tar.gz"
    sha256 "f4d5de6062b8b0e66a9049cdc0c90de9f79bb1cfcc1a19c74518ddb0a8698e2e"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.110.0/otelcol-contrib_0.110.0_darwin_arm64.tar.gz"
      sha256 "ab907ae9ce01a55dd9356c797e827b531c72ea40d644cac10b73ee4e4e2b104c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.110.0/otelcol-contrib_0.110.0_darwin_amd64.tar.gz"
      sha256 "b846893e53e5003c23d6f6c882b20b38e8250b6ba2ead83303feea01648ce1df"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
