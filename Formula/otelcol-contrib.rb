class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.131.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.131.1/otelcol-contrib_0.131.1_linux_amd64.tar.gz"
    sha256 "f03e16f547142df7f388017425dcc804a39ec73bb7b36a4ccfe1122a53735181"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.131.1/otelcol-contrib_0.131.1_darwin_arm64.tar.gz"
      sha256 "07e31c8cc00f981569fc37b58ab7289ed83ea42e7381fe994d8318cc5086bd05"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.131.1/otelcol-contrib_0.131.1_darwin_amd64.tar.gz"
      sha256 "eeb7605b74a5f4ced4f80b51c162e8a1731bdfb5d637d152a6557505f2e2ea24"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
