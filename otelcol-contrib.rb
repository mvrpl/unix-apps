class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.108.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.108.0/otelcol-contrib_0.108.0_linux_amd64.tar.gz"
    sha256 "dc4676eec072953d0ccbae768e7eb352126eb66f529381615a4448042487f2dc"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.108.0/otelcol-contrib_0.108.0_darwin_arm64.tar.gz"
      sha256 "ffc46c1893135d324fdfc80e34c04692a8c30767b7285f1d040e2e26d31a6976"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.108.0/otelcol-contrib_0.108.0_darwin_amd64.tar.gz"
      sha256 "e24a1612118ee73f1855771ab0c1a34d103c4e3aadd23d0434549c3d35d4b07a"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
