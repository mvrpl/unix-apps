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
    url "https://github.com/mvrpl/dataflow/releases/download/0.1.5/dataflow-linux-amd64"
    sha256 "ef08b9785c20121c9b33f7eb9fe1216a4fc1e9a9d8e2c706f87008ca229d4f69"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/dataflow/releases/download/0.1.0/dataflow-darwin-arm64"
      sha256 "64139e9d674a3ed4a48c51fc445899f5cdd45fc64676ad364fbaa6349b64068f"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mvrpl/dataflow/releases/download/0.1.0/dataflow-darwin-amd64"
      sha256 "84b583d32f218ba6192e4fa9cb4c9a379abfca01b4e0ee239d5a6bcfb4b9abd0"
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
