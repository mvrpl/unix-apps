class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.154.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.154.0/otelcol-contrib_0.154.0_linux_amd64.tar.gz"
    sha256 "f0fe6e7b1d81936d4e5a3aad7a678f3fc2f8ada2a9f8f37f37542813c12ed322"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.154.0/otelcol-contrib_0.154.0_darwin_arm64.tar.gz"
      sha256 "de3af70ef0b80af213911cc9ba8daf553348dd22ed1fb15db561d207fc2cb3d9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.154.0/otelcol-contrib_0.154.0_darwin_amd64.tar.gz"
      sha256 "14f7f825a7ad7ee0799947ff70a42b9a5528a9c1411ab45f8fcc4caeb9346f7b"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
