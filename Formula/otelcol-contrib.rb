class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.166.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.166.0/otelcol-contrib_0.166.0_linux_amd64.tar.gz"
    sha256 "928cb39c115d428c53211818b7e33cd8b26810b8896dc74e0bd13b8d1457c391"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.166.0/otelcol-contrib_0.166.0_darwin_arm64.tar.gz"
      sha256 "b7d9e47c0a09572eebc314ddebcea8773608bd3910d06164c57eb46bbc09adad"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.166.0/otelcol-contrib_0.166.0_darwin_amd64.tar.gz"
      sha256 "7cfc362e71824d6103b8a2486b04223e50268083f6519568eb399bfc2c4358cd"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
