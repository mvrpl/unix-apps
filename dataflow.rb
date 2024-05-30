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
      url "https://github.com/mvrpl/dataflow/releases/download/0.1.5/dataflow-darwin-arm64"
      sha256 "b403e25b91c311e3ab2f77930378cfe6a4e9bd578f08c5699cdad1841f795d8f"
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
