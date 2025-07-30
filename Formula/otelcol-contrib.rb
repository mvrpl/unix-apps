class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.131.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.131.0/otelcol-contrib_0.131.0_linux_amd64.tar.gz"
    sha256 "336894d4464c34faa99906a980197edea956fa87b8fc5bf2f8484e6925f94875"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.131.0/otelcol-contrib_0.131.0_darwin_arm64.tar.gz"
      sha256 "032b1ed9a23890b4e914b4493a2e752a0027456fca570055c0bd72ba836470d6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.131.0/otelcol-contrib_0.131.0_darwin_amd64.tar.gz"
      sha256 "81856efeaefb1c1eaf18317dcd2925a5f3a297d77e9cfec5efec9e24e43e4c81"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
