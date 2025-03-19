class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.122.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.122.0/otelcol-contrib_0.122.0_linux_amd64.tar.gz"
    sha256 "22a053fc960ca5e1b936a3e8b3060322ff0bcf04ae14ec46d77f40c8d495a322"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.122.0/otelcol-contrib_0.122.0_darwin_arm64.tar.gz"
      sha256 "9ed9955153d8fc8c717b2e9bd07bd5e205c24298c2990f2534ad040446070933"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.122.0/otelcol-contrib_0.122.0_darwin_amd64.tar.gz"
      sha256 "2e83588ca2977fd02e3e4009e1a6ce9d08b8b56f75834ac04e7a998383bc63ec"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
