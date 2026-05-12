class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.152.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.152.0/otelcol-contrib_0.152.0_linux_amd64.tar.gz"
    sha256 "f8d96a0c72454bf993ccb74776d24d3a9b8e74c9d5e167b0109f9b510bd7605e"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.152.0/otelcol-contrib_0.152.0_darwin_arm64.tar.gz"
      sha256 "0a5a4f595e7f1e6d885102fa89abdd41eb4fd1ef432ee7553818fef2ccb93339"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.152.0/otelcol-contrib_0.152.0_darwin_amd64.tar.gz"
      sha256 "2526688e8e0f890024fc2d13513274bd724e1da7423ef5f4f1f92f97d1bd4aef"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
