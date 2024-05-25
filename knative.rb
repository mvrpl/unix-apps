class Knative < Formula
  desc "Knative developer experience, docs, reference Knative CLI implementation."
  homepage "https://github.com/knative/client"
  version "1.14.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/knative/client/releases/download/knative-v1.14.0/kn-linux-amd64"
    sha256 "df33d4ed1323bfa20e84e046c13e0717e6e2a162e8a3c1b170d51d3b1d088b1c"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/knative/client/releases/download/knative-v1.14.0/kn-darwin-arm64"
      sha256 "8da5bcde9de0069b1e08159496008a76349fd2ceb6d455c754458c30b7852f8a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/knative/client/releases/download/knative-v1.14.0/kn-darwin-amd64"
      sha256 "2f914e9900055b6b3300ade375699ed4c064ea38e840faf7c37785dc17fbe3be"
    end
  end

  def install
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      bin.install "kn-linux-amd64" => "kn"
    end

    if OS.mac?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "kn-darwin-arm64" => "kn"
      end

      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "kn-darwin-amd64" => "kn"
      end
    end
  end
end
