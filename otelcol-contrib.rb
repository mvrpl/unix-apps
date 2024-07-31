class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.106.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.106.0/otelcol-contrib_0.106.0_linux_amd64.tar.gz"
    sha256 "de39361d1e3ec60b5fbd7eabe9d7949d7a0445a44fd9b0032692e70dcb52d780"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.106.0/otelcol-contrib_0.106.0_darwin_arm64.tar.gz"
      sha256 "bce4dc4ab635adbd26d2caac2cfb37ea0e7da01860d39d2cd90d5b1a668ee22e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.106.0/otelcol-contrib_0.106.0_darwin_amd64.tar.gz"
      sha256 "605915dcf058bd943892b91f2374e907a70ab2cde6243384cb2e7af061ec1af9"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
