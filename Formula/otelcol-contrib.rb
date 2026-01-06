class OtelcolContrib < Formula
  desc "OpenTelemetry Collector Contrib"
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  version "0.143.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.143.0/otelcol-contrib_0.143.0_linux_amd64.tar.gz"
    sha256 "de3d8fd2a30d8df30a940df0500ae9af59ab807783b1529c776ba40eb0a05981"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.143.0/otelcol-contrib_0.143.0_darwin_arm64.tar.gz"
      sha256 "ba6954a104c1a2e71307ef60d967703f71953adfa538bf41d6abf43c446bdd53"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.143.0/otelcol-contrib_0.143.0_darwin_amd64.tar.gz"
      sha256 "eb0a983712df537cccc88333e1581dcd8eee28f0510053783b14bfd0bbf94b49"
    end
  end

  def install
    bin.install "otelcol-contrib"
  end
end
