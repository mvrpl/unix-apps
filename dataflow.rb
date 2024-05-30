class Dataflow < Formula
  desc "ETL configurable written in Rust"
  homepage "https://github.com/mvrpl/dataflow"
  version "0.1.5"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/mvrpl/dataflow/releases/download/0.1.0/dataflow-linux-amd64"
    sha256 "f889e62e6a71b6331bd11c605ba7beb44218fc3f39f4227afa2d2d51e28b8756"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/dataflow/releases/download/0.1.0/dataflow-darwin-arm64"
      sha256 "64139e9d674a3ed4a48c51fc445899f5cdd45fc64676ad364fbaa6349b64068f"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/dataflow/releases/download/0.1.5/dataflow-darwin-amd64"
      sha256 "3ea9f562eb0b070ff187ea9545da7854ad0948f7b2c6de91d78af0f3c2405584"
    end
  end

  def install
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      bin.install "dataflow-linux-amd64" => "dataflow"
    end

    if OS.mac?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "dataflow-darwin-arm64" => "dataflow"
      end

      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "dataflow-darwin-amd64" => "dataflow"
      end
    end
  end
end
