class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.130.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.130.1/otelcol-contrib_0.130.1_linux_amd64.tar.gz"
    sha256 "f1f9b9c70aff81ca8872991984fbd6850a675c56776f57f737e63ccef1b27aad"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.130.1/otelcol-contrib_0.130.1_darwin_arm64.tar.gz"
      sha256 "ead67657bfb48dfc224ad81c8d0eb7020e8bcc6dd763cfeeb2d965ad32b40633"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.130.1/otelcol-contrib_0.130.1_darwin_amd64.tar.gz"
      sha256 "4fb05ca8a7b84bcdf343a07773aa8d0475a447224cb40670fc56671c0ae61c19"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
