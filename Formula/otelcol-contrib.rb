class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.153.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.153.0/otelcol-contrib_0.153.0_linux_amd64.tar.gz"
    sha256 "f7be4acf2c04058875073afc2e74ef885a66ef4fac8a4bfc93faa7235cb1c174"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.153.0/otelcol-contrib_0.153.0_darwin_arm64.tar.gz"
      sha256 "3371b4100c56f853e236b8efa4a134516c5ac09183a07e397a2265f4ab61d63f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.153.0/otelcol-contrib_0.153.0_darwin_amd64.tar.gz"
      sha256 "b7f5a5c1082b5cc70d9f205d77d36e35b60c45ae06f4f1be39de660f066bd118"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
