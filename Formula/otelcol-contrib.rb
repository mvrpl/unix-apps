class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.136.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.136.0/otelcol-contrib_0.136.0_linux_amd64.tar.gz"
    sha256 "e642146998b9559929c34f5b85525e27ca6430585e2951fa88a403ff5ebf9f47"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.136.0/otelcol-contrib_0.136.0_darwin_arm64.tar.gz"
      sha256 "1174f369679aa620dddd7612885268f3a3edf6d1544e10d79f334df5aa413f3f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.136.0/otelcol-contrib_0.136.0_darwin_amd64.tar.gz"
      sha256 "e4d100924aa93a5050171b9db99e17dcce8fea17898c385147b802b781489759"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
