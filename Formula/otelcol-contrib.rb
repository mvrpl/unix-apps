class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.139.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.139.0/otelcol-contrib_0.139.0_linux_amd64.tar.gz"
    sha256 "7d4356adf690b1a08f5d536331dc932ee28d31fd80801b6e960cd6b5618f86db"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.139.0/otelcol-contrib_0.139.0_darwin_arm64.tar.gz"
      sha256 "c85350e89a48ca5077585ce18b2060e134af398453954912f0f6d1638a5cce7e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.139.0/otelcol-contrib_0.139.0_darwin_amd64.tar.gz"
      sha256 "93e124783840f4f480c7c996d482189ea0c71d78bf9d22e7fd1c8c74976d0615"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
