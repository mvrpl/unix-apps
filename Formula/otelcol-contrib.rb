class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.149.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.149.0/otelcol-contrib_0.149.0_linux_amd64.tar.gz"
    sha256 "4acb57355e9388f257b28de8c18422ff43e52eb329052bd54ebecde000dcbb47"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.149.0/otelcol-contrib_0.149.0_darwin_arm64.tar.gz"
      sha256 "999e1fcc2097171acc2054442c4733e05f9d91f94b6acf4c92b92f6a6260c3b7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.149.0/otelcol-contrib_0.149.0_darwin_amd64.tar.gz"
      sha256 "85ba90ac48a921f5fcd8d44eb182045b87b12c5bd1e924ffa6301353b01b9272"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
