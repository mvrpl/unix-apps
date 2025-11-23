class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.140.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.140.0/otelcol-contrib_0.140.0_linux_amd64.tar.gz"
    sha256 "4bacc689cadffd5b4d468a6ac67c7c3cb4ff07000533fe1cb8f5d8b5d557ac79"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.140.0/otelcol-contrib_0.140.0_darwin_arm64.tar.gz"
      sha256 "606b32c6c85ae44046e8673193ed7719d1aaecf0b4af846e26e0f8be4609b5eb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.140.0/otelcol-contrib_0.140.0_darwin_amd64.tar.gz"
      sha256 "224a6c21a6175aec3be392f8bb3b82f1e8ebeff67d174b9f6eabaaa065ea1c23"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
