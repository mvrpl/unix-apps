class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.111.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.111.0/otelcol-contrib_0.111.0_linux_amd64.tar.gz"
    sha256 "bce8ab7431d25529fb8820f0729c8b60b090d0d7e36b9b668aec88698b64439a"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.111.0/otelcol-contrib_0.111.0_darwin_arm64.tar.gz"
      sha256 "e56bf2cb535b6c089915415d2ab5e477c98628d03f3376aaf9124fa4f8b24f97"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.111.0/otelcol-contrib_0.111.0_darwin_amd64.tar.gz"
      sha256 "c00024fd85008e265db7238b019732935475604aad5457772913643db0c707bd"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
