class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.127.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.127.0/otelcol-contrib_0.127.0_linux_amd64.tar.gz"
    sha256 "9c021c9c918fbcb5ea41bd340f4914b6167c27e529df6a33860d063f2de3c712"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.127.0/otelcol-contrib_0.127.0_darwin_arm64.tar.gz"
      sha256 "dd222f9b6163b513c17c4b7fc257151e0b7e555dcc9db6d8ca0f26a7ff5438d5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.127.0/otelcol-contrib_0.127.0_darwin_amd64.tar.gz"
      sha256 "483475ccd3a51f8afd901f3efced500957858cc1b2115c6f3db545fce6c7e91d"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
